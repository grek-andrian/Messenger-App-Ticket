module MailboxHelper
    def unread_messages_count
        @unread_count = mailbox.inbox(read: false).count(:id, distinct: true).to_s
    end
end
