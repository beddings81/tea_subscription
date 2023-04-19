# Tea Subscription

This is a practice take-home challenge where I created a Rails API for a Tea Subscription Service.

## RESTful Endpoints

<details close>


## New Subscription

```http
POST /api/v1/subscriptions
```

<details close>
<summary>  Details </summary>
<br>
    
Request Body: <br>
* customer_id: Customer ID from db(1-2)
* tea_id: Tea ID from db(1-10)
* title: Name for Subscription
* price: Price for Subscription(must be a float)
* frequency: 0 = weekly, 1 = monthly, 2 = annual

```json
{
    "subscription": {
                        "customer_id": 1,
                        "tea_id": 7,
                        "title": "Green Tea",
                        "price": 19.99,
                        "frequency": 1
                    }
}
```

| Code | Description |
| :--- | :--- |
| 201 | `Created` |

Response Body:

```json
{
    "data": {
        "id": "3",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 7,
            "title": "Green Tea",
            "price": 19.99,
            "frequency": "monthly",
            "status": "active"
        }
    }
}
```

</details>

---

### Cancel/Activate a Subscription


```http
PATCH /api/v1/subscriptions/<subscription_id>
```

<details close>
<summary>  Details </summary>
<br>

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response Body:

```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 1,
            "title": "Green Tea",
            "price": 19.99,
            "frequency": "monthly",
            "status": "cancelled"
        }
    }
}
```

</details>

---


### List all Subscriptions for a Customer



```http
GET /api/v1/customers/<customer_id>/subscriptions
```

<details close>
<summary>  Details </summary>
<br>

| Code | Description |
| :--- | :--- |
| 200 | `OK` |

Response Body:

```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "Green Tea",
                "price": 19.99,
                "frequency": "monthly",
                "status": "cancelled"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 9,
                "title": "Green Tea",
                "price": 19.99,
                "frequency": "monthly",
                "status": "active"
            }
        },
        {
            "id": "3",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 7,
                "title": "Green Tea",
                "price": 19.99,
                "frequency": "monthly",
                "status": "active"
            }
        }
    ]
}
```

</details>
</details>

## Status Codes

| Status Code | Description |
| :--- | :--- |
| 200 | `OK` |
| 201 | `CREATED` |
| 400 | `BAD REQUEST` |
| 404 | `NOT FOUND` |
| 500 | `INTERNAL SERVER ERROR` |

## Prerequisites
Running this project requires:
- Rails 5.2.8
- Ruby 2.7.4

## Installation

1. Fork and clone this repository
2. `cd` into the root directiory
3. `bundle install`
4. `rails db:{drop,create,migrate,seed}`
5. Run the test suite with `bundle exec rspec`
6. Start the local server by running `rails s`
7. Visit the app on `localhost:300` in your web browser

## Database
<img width="1076" alt="Screenshot 2023-04-19 at 12 01 11 PM" src="https://user-images.githubusercontent.com/111210465/233160752-eb69d365-d05f-4963-801f-ff766955c901.png">
