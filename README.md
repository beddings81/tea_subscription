# Tea Subscription

This README would normally document whatever steps are necessary to get the
application up and running.

* Ruby Version
    2.7.4
* Rails Version
    5.2.8.1
    
* Database initialization
    `rails db:{create,migrate}`
    
* Run Test Suite
    `bundle exec rspec`
## Database
<img width="1076" alt="Screenshot 2023-04-19 at 12 01 11 PM" src="https://user-images.githubusercontent.com/111210465/233160752-eb69d365-d05f-4963-801f-ff766955c901.png">


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

## Cancel a Subscription


## List all Subscriptions for a Customer
