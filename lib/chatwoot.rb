# frozen_string_literal: true

require "rest-client"
require "json"
require "chatwoot/contact"
require "chatwoot/conversation"
require "chatwoot/message"

module Chatwoot
  class ChatwootError < StandardError
  end

  class AuthenticationError < ChatwootError
  end

  class ConfigurationError < ChatwootError
  end

  class ApiRequestError < ChatwootError
    attr_reader :response_code, :response_headers, :response_body

    def initialize(response_code:, response_headers:, response_body:)
      @response_code = response_code
      @response_headers = response_headers
      @response_body = response_body
    end
  end

  class << self
    def api_base_url
      defined? @api_base_url and @api_base_url or raise(
        ConfigurationError, "Chatwoot api_base_url not configured"
      )
    end

    attr_writer :api_base_url

    def token
      defined? @token and @token or raise(
        ConfigurationError, "Chatwoot token not configured"
      )
    end

    attr_writer :token

    def account_id
      defined? @account_id and @account_id or raise(
        ConfigurationError, "Chatwoot account_id not configured"
      )
    end

    attr_writer :account_id

    def request method, resource, params = {}
      api_base_url = Chatwoot.api_base_url
      auth_token = Chatwoot.token
      # account_id = Chatwoot.account_id

      params.reject { |k, v| ["api_base_url", "token", "account_id"].include?(k.to_s) } if params != {}

      defined? method or raise(
        ArgumentError, "Request method has not been specified"
      )
      defined? resource or raise(
        ArgumentError, "Request resource has not been specified"
      )
      if method == :get
        headers = {accept: :json, content_type: :json}.merge({params: params})
        payload = nil
      else
        headers = {accept: :json, content_type: :json}
        payload = params
      end

      if auth_token
        headers = headers.merge(api_access_token: auth_token)
      end

      json_payload = payload.to_json if payload

      RestClient::Request.new({
        method: method,
        url: "#{api_base_url}/#{resource}",
        headers: headers,
        payload: json_payload
      }).execute do |response, request, result|
        JSON.parse(response.to_str) if response
      end
    end

    def datetime_format datetime
      datetime.strftime("%Y-%m-%d %T")
    end
  end
end
