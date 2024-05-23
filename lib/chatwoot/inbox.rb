module Chatwoot
  class Inbox
    class << self
      # List all conversations
      def list
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/inboxes")
        response
      end

      def details(inbox_id)
        raise "inbox_id is missing" unless inbox_id
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/inboxes/#{inbox_id}")
        response
      end

      # Create a new conversation, custom_attributes later
      def create_by_contact(contact_id, params = {})
        Chatwoot.request(:post, "api/v1/inboxes/13/contacts/#{contact_id}/conversations", params)
      end
    end
  end
end
