module Chatwoot
  class Contact
    class << self
      # https://www.chatwoot.com/developers/api/#operation/contactList
      def list
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/contacts")
        response["payload"]
      end

      # https://www.chatwoot.com/developers/api/#operation/contactCreate
      def create(params = {})
        raise "name is missing" unless params[:name]
        raise "email is missing" unless params[:email]
        raise "identifier is missing" unless params[:identifier]
        Chatwoot.request(:post, "api/v1/accounts/#{Chatwoot.account_id}/contacts", params)
      end

      # https://www.chatwoot.com/developers/api/#operation/contactUpdate
      def update(contact_id, params = {})
        raise "contact_id is missing" unless contact_id
        Chatwoot.request(:put, "api/v1/accounts/#{Chatwoot.account_id}/contacts/#{contact_id}", params)
      end

      # https://www.chatwoot.com/developers/api/#operation/contactDetails
      def details(contact_id)
        raise "contact_id is missing" unless contact_id
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/contacts/#{contact_id}")
        response["payload"]
      end

      # https://www.chatwoot.com/developers/api/#operation/contactSearch
      # /api/v1/accounts/{account_id}/contacts/search
      def search(query, sort = "identifier", page = 1)
        response = Chatwoot.request(:get, "api/v1/accounts/#{Chatwoot.account_id}/contacts/search?q=#{query}&sort=#{sort}&page=#{page}")
        response["payload"]
      end

      # https://www.chatwoot.com/developers/api/#operation/contactDelete
      def delete(contact_id)
        raise "contact_id is missing" unless contact_id
        Chatwoot.request(:delete, "api/v1/accounts/#{Chatwoot.account_id}/contacts/#{contact_id}")
      end

      def find_or_create_by_email(params)
        raise "email is missing" unless params[:email]
        result = search(params[:email], "email")
        if result.empty?
          create(params)
        else
          update(result.first["id"], params)
        end
      end

      def find_or_create_by_identifier(params)
        raise "identifier is missing" unless params[:identifier]
        result = search(params[:identifier])
        if result.empty?
          create(params)
        else
          update(result.first["id"], params)
        end
      end
    end
  end
end
