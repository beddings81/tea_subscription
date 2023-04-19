# Tea Service

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

## New Subscription
### POST '/api/v1/subscriptions'
* customer_id: Customer ID from db
* tea_id: Tea ID from db
* title: Name for Subscription
* price: Price for Subscription(must be a float)
* frequency: 0 = weekly, 1 = monthly, 2 = annual

request body: 
``` json
{
    "subscription": {
                        "customer_id": 1,
                        "tea_id": 1,
                        "title": "Green Tea",
                        "price": 19.99,
                        "frequency": 1
                    }
}
```
response body:
```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "id": 1,
            "customer_id": 1,
            "tea_id": 1,
            "title": "Green Tea",
            "price": 19.99,
            "frequency": "monthly",
            "status": "active"
        }
    }
}
```
