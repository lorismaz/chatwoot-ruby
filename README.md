# chatwoot

A ruby gem to interact with Chatwoot

[Release Notes](https://github.com/lorismaz/)

## Installation

Add module to your Gemfile:

```ruby
gem 'chatwoot'
```

Then run bundle to install the Gem:

```sh
bundle install
```

Set up an initializer file with your Chatwoot Base URL, username, password:

```ruby
Chatwoot.api_base_url = "https://app.chatwoot.com"
Chatwoot.token  = "token"
Chatwoot.account_id = "account id"
```

or

```ruby
Chatwoot.api_base_url = ENV["CHATWOOT_URL"]
Chatwoot.token  = ENV["CHATWOOT_TOKEN"]
Chatwoot.account_id = ENV["CHATWOOT_ACCOUNT_ID"]
```
e.g. *config/initializers/chatwoot.rb*

## Usage

### List contacts
Retrieves a list of contacts in an account

API doc: https://www.chatwoot.com/developers/api/#operation/contactList

```ruby
contact_list = Chatwoot::Contact.list
```

---

### Create a contact
Creates a contact in chatwoot

API doc: https://www.chatwoot.com/developers/api/#operation/contactCreate

```ruby
# the following params below are mandatory according to the API doc

params_contact = {
  "inbox_id": 0,
  "name": "string",
  "email": "string",
  "phone_number": "string",
  "identifier": "string",
  "custom_attributes": { } 
}
contact = Chatwoot::Contact.create(params_contact)
```

---

### Create a conversation
Creates a conversation in chatwoot

API doc: https://www.chatwoot.com/developers/api/#tag/Conversations/operation/newConversation

```ruby
# source_id and inbox_id are mandatory according to the API doc

params_conversation = {
  source_id: 'string',
  inbox_id: 'string',
  contact_id: 'string',
  status: 'string'
}
conversation = Chatwoot::Conversation.create(params_conversation)
```

---

### Create a message
Creates a message in chatwoot

API doc: https://www.chatwoot.com/developers/api/#tag/Messages/operation/create-a-new-message-in-a-conversation

```ruby
# account_id and content are mandatory according to the API doc

params_message = {
  account_id: 5,
  content: "hello simple visa team",
  message_type: "outgoing"
}
message = Chatwoot::Conversation.create(conversation_id, params_message)
```

---


## Copyright
Copyright (c) 2021 [lorismaz](https://github.com/lorismaz)
Licenced under the MIT licence.
