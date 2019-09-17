-- AppleScript template for Notification Center
-- `operation` - the operation name
set operation to "{{operation}}"

my dismissNotifications()
on dismissNotifications()

    tell application "System Events"

        tell process "Notification Center"

            set notifications to every window
            set buttonItems to number of items in notifications

            repeat until buttonItems is 0

                repeat with i from 1 to number of items in notifications
                    set buttonItem to item i of notifications

                    try
                        click button 1 of buttonItem
                    on error
                        my dismissNotifications()
                    end try

                end repeat

                set notifications to every window
                set buttonItems to number of items in notifications

            end repeat

        end tell

    end tell

end dismissNotifications

if operation is "dismiss-notifications" then

    dismissNotifications()

end
