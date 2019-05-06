import json
import HTMLParser

class FacebookMessengerParser(HTMLParser.HTMLParser):
    def __init__(self):
        HTMLParser.HTMLParser.__init__(self)
        self.in_conversation_list = False
        self.current_conversation_link = ""
        self.have_conversation_image = False
        self.conversations = []
        self.conversation_image_links = {}
        self.data = []

    def handle_starttag(self, tag, attributes):
        # Assumptions: conversation list can be found as a `<ul>` tag with a `aria-label="Conversation List"` attribute
        if tag == "ul" and ("aria-label", "Conversation List") in attributes:
            self.in_conversation_list = True

        # Assumptions: conversation image link can be found in a `<img>` tag as a `src` attribute inside a conversation
        if tag == "img" and self.current_conversation_link and not self.have_conversation_image:
            [image_link] = [attribute[1] for i, attribute in enumerate(attributes) if attribute[0] == "src"]
            self.conversation_image_links[self.current_conversation_link] = image_link
            self.have_conversation_image = True

        # Assumptions: the conversation link can be found in a single `<a>` tag inside a conversation list
        # with a `role="link"` attribute in the `data-href` attribute
        if tag == "a" and ("role", "link") in attributes:
            [link] = [attribute[1] for i, attribute in enumerate(attributes) if attribute[0] == "data-href"]
            self.data.append(link)
            self.current_conversation_link = link

    def handle_endtag(self, tag):
        # Finished processing a single conversation
        if self.current_conversation_link and tag == "a":
            self.conversations.append(self.data)
            self.current_conversation_link = None
            self.have_conversation_image = False
            self.data = []

        # Finished processing conversation list
        if self.in_conversation_list and tag == "ul":
            self.in_conversation_list = False

            conversation_list = []

            for i, conversation in enumerate(self.conversations):
                link = conversation[0]
                name = conversation[1]
                datetime = conversation[2]
                message_list = conversation[3:len(conversation)]
                message = " ".join(message_list).decode('utf-8','ignore').encode("utf-8")
                imagelink = self.conversation_image_links.get(link)

                conversation_list.append({
                    "link": link,
                    "name": name,
                    "datetime": datetime,
                    "message": message,
                    "imagelink": imagelink,
                })

            # Return result to applescript
            print json.dumps(conversation_list, separators=(',',':'))

    def handle_data(self, data):
        # Assumptions: the only text data inside a conversation block will be the following (in a consistent order):
        # [1]: user or group name
        # [2]: date or time
        # [3/4/5]: last message sender name (optional), colon or some other text (optional), last message text
        if self.current_conversation_link and not data.isspace():
            self.data.append(data)

