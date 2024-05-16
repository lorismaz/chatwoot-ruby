module Chatwoot
  class Message
    class << self
      # List all messages for a specific conversation
      def list(conversation_id)
        raise "conversation_id is missing" unless conversation_id
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}/messages")
        response["payload"]
      end

      # Create a new message in a specific conversation
      def create(conversation_id, params = {})
        raise "conversation_id is missing" unless conversation_id
        required_params = [:account_id, :content, :message_type]
        required_params.each do |param|
          raise "#{param} is missing" unless params[param]
        end
        Chatwoot.request(:post, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}/messages", params)
      end

      # Update an existing message
      def update(conversation_id, message_id, params = {})
        raise "conversation_id is missing" unless conversation_id
        raise "message_id is missing" unless message_id
        Chatwoot.request(:put, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}/messages/#{message_id}", params)
      end

      # Get details of a specific message
      def details(conversation_id, message_id)
        raise "conversation_id is missing" unless conversation_id
        raise "message_id is missing" unless message_id
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}/messages/#{message_id}")
        response["payload"]
      end

      # Delete a specific message
      def delete(conversation_id, message_id)
        raise "conversation_id is missing" unless conversation_id
        raise "message_id is missing" unless message_id
        Chatwoot.request(:delete, "api/v1/accounts/#{Chatwoot.account_id}/conversations/#{conversation_id}/messages/#{message_id}")
      end
    end
  end
end
