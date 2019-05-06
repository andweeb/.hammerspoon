import sys
from facebook_messenger_parser import FacebookMessengerParser

url = sys.argv[1]
htmlPath = sys.argv[2]

f = open(htmlPath, "rt")
html = f.read()

parsers = {
    "https://www.messenger.com": FacebookMessengerParser,
}

parser = parsers[url]()
parser.feed(html)
