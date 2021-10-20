require "minitest/autorun"
require "webmock/minitest"
require "chatwoot"
require "byebug"

WebMock.disable_net_connect!(allow_localhost: true)

class ChatwootTest < Minitest::Test
  def setup
    @params = {}
    Chatwoot.api_base_url = "https://example.com"
    Chatwoot.token = "1234"
    Chatwoot.account_id = "3456"
  end

  def test_contact_list
    stub_request(:get, /contacts/).to_return body: {payload: []}.to_json
    response = Chatwoot::Contact.list
    assert_instance_of(Array, response)
  end
end
