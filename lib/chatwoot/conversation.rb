module Chatwoot
  class Conversation
    class << self
      # List all conversations
      def list
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/conversations")
        response["data"]["payload"]
      end

      def list_by_contact(contact_id)
        raise "contact_id is missing" unless contact_id
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/contacts/#{contact_id}/conversations")
        response["payload"]
      end

      # Create a new conversation
      def create(params = {})
        required_params = [:source_id, :inbox_id, :contact_id, :status]
        required_params.each do |param|
          raise "#{param} is missing" unless params[param]
        end
        Chatwoot.request(:post, "api/v1/accounts/#{Chatwoot.account_id}/conversations", params)
      end

      # Create a new conversation, custom_attributes later
      def create_by_contact(contact_id, params = {})
        Chatwoot.request(:post, "api/v1/inboxes/13/contacts/#{contact_id}/conversations", params)
      end

      # Update an existing conversation
      def update(conversation_id, params = {})
        raise "conversation_id is missing" unless conversation_id
        Chatwoot.request(:put, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}", params)
      end

      # Get details of a specific conversation
      def details(conversation_id)
        raise "conversation_id is missing" unless conversation_id
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}")
        response
      end

      # Delete a specific conversation
      def delete(conversation_id)
        raise "conversation_id is missing" unless conversation_id
        Chatwoot.request(:delete, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}")
      end
    end
  end
end
