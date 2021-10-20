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

params = {
  "inbox_id": 0,
  "name": "string",
  "email": "string",
  "phone_number": "string",
  "identifier": "string",
  "custom_attributes": { } 
}
contact = Chatwoot::Contact.create(params)
```

---

## Copyright
Copyright (c) 2021 [lorismaz](https://github.com/lorismaz)
Licenced under the MIT licence.
