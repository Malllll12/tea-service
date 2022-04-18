# TEA SERVICE
Exposes a Rails API for a Tea Subscription Service

- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer’s tea subscription
- An endpoint to see all of a customer’s subsciptions (active and cancelled)

----------

### Set Up
On your local system, open a terminal session to run the following commands:
1. Clone this repository `$ git clone git@github.com:Malllll12/tea-service.git`
2. Navigate to the newly cloned directory `$ cd tea-service`
3. If bundler is not installed run `$ gem install bundler`
4. If or after bundler is installed run `$ bundle install` to install the required Gems
5. If errors occur, check for proper installation and versions of `bundler`, `ruby`, and `rails`
6. Set up the database locally with `$ rails db:{:drop,:create,:migrate,:seed}`
7. Open your text editor and check to see that `schema.rb` exists
8. You may also run the RSpec test suite locally with the command `$ bundle exec rspec` to ensure everything is functioning as expected.

----------

### Versions

- Ruby 2.7.2
- Rails 5.2.6

----------

## Gems
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop/rubocop) 
- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails), [faker](https://github.com/vajradog/faker-rails), [webmock](https://github.com/bblimke/webmock), [vcr](https://github.com/vcr/vcr)

- API: [faraday](https://github.com/lostisland/faraday), [figaro](https://medium.com/@MinimalGhost/the-figaro-gem-an-easier-way-to-securely-configure-rails-applications-c6f963b7e993)
----------


## API

### All Subscriptions Endpoint
| http verb | name | description | example |
| --- | --- | --- | --- |
| GET | /subscriptions | Returns all customer subscriptions, active and cancelled | /api/v1/subscriptions |

<details>
  <summary> JSON response examples </summary>

  User:
```
{
    "data": {
        "id": "324",
        "type": "users",
        "attributes": {
            "email": "fake@example.com",
            "api_key": "notarealkey"
        }
    }
}
  ```
</details>

### Create New Subscription
| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /subscription | Creates a new subscription | /api/v1/subscription |

<details>
  <summary> JSON response examples </summary>

  Create Subscription:
```
{
    "data": {
        "id": "324",
        "type": "users",
        "attributes": {
            "email": "fake@example.com",
            "api_key": "notarealkey"
        }
    }
}
  ```
</details>

### Cancel subscription
| http verb | name | description | example |
| --- | --- | --- | --- |
| PATCH | /subscription | cancels an existing subscription | /api/v1/subscription |

<details>
  <summary> JSON response examples </summary>

  Cancel Subscription:
```
{
    "data": {
        "id": "null",
        "type": "roadtrip",
        "attributes": {
            "start_city": "Denver,CO",
            "end_city": "Montrose,CO",
            "travel_time": "04:44:25",
            "weather_at_eta": {
                "temperature": 31.59,
                "conditions": "few clouds"
            }
        }
    }
}
  ```
</details>
