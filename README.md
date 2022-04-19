# TEA SERVICE
![kermit](https://user-images.githubusercontent.com/69017022/163875163-11ab2a8a-2c6f-4c1e-ac0f-ba5ecb2c9816.jpeg)


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
- Testing: [rspec-rails](https://github.com/rspec/rspec-rails), [simplecov](https://github.com/simplecov-ruby/simplecov), [pry](https://github.com/pry/pry), [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- Serializer: [jsonapi-serializer](https://github.com/fotinakis/jsonapi-serializers)
----------

## Schema
![Screen Shot 2022-04-19 at 3 26 32 PM](https://user-images.githubusercontent.com/69017022/164104719-57ffd4ba-f958-4499-9cc5-1110e3810fed.png)

----------

## API

### All Subscriptions Endpoint
| http verb | name | description | example |
| --- | --- | --- | --- |
| GET | /subscriptions | Returns all customer subscriptions, active and cancelled | /api/v1/subscriptions/2 |

<details>
  <summary> JSON response examples </summary>

```
{
    "data": [
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "title": "Tea Party",
                "price": 9.99,
                "status": "active",
                "frequency": 2,
                "customer_id": 2,
                "tea_id": 1
            }
        },
        {
            "id": "5",
            "type": "subscription",
            "attributes": {
                "title": "Hello it's Tea",
                "price": 39.99,
                "status": "active",
                "frequency": 3,
                "customer_id": 2,
                "tea_id": 3
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "title": "Is it Tea Your Looking For?",
                "price": 39.99,
                "status": "cancelled",
                "frequency": 3,
                "customer_id": 2,
                "tea_id": 3
            }
        }
    ]
}
  ```
</details>

### Create New Subscription
| http verb | name | description | example |
| --- | --- | --- | --- |
| POST | /subscription | Creates a new subscription | /api/v1/subscriptions |

<details>
  <summary> JSON response examples </summary>

  Create Subscription:
```
{
    "data": {
        "id": "5",
        "type": "subscription",
        "attributes": {
            "title": "Hello it's Tea",
            "price": 39.99,
            "status": "active",
            "frequency": 3,
            "customer_id": 2,
            "tea_id": 3
        }
    }
}
  ```
</details>

### Cancel subscription
| http verb | name | description | example |
| --- | --- | --- | --- |
| PATCH | /subscription | cancels an existing subscription | /api/v1/subscriptions/2 |

<details>
  <summary> JSON response examples </summary>

  Cancel Subscription:
```
{
    "data": {
        "id": "2",
        "type": "subscription",
        "attributes": {
            "title": "Is it Tea Your Looking For?",
            "price": 39.99,
            "status": "cancelled",
            "frequency": 3,
            "customer_id": 2,
            "tea_id": 3
        }
    }
}
  ```
</details>
