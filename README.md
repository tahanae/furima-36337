# README

## users_table
| Column             | Type     | Option                        |
| -------------------| -------- | ----------------------------- |
| name               | string   | null: false                   |
| email              | string   | null: false, uniqueness: true |
| encrypted_password | string   | null: false                   |
| first_name         | string   | null: false                   |
| last_name          | string   | null: false                   |
| date_of_birth      | datetime | null: false                   |

### Association
has_many :items
has_many :buyers



## items_table
| Column          | Type       | Option                        |
| --------------- | ---------- | ----------------------------- |
| title           | string     | null: false                   |
| explanation     | text       | null: false                   |
| category_id     | integer    | null: false                   |
| condition       | boolean    | null: false                   |
| derivery_charge | boolean    | null: false                   |
| area            | boolean    | null: false                   |
| day             | datetime   | null: false                   |
| price           | integer    | null: false                   |
| user            | references | null: false foreign_key: true |

### Association
has_one :users
has_one :buyers



## buyers_table
| user | refarences | null: false foreign_key: true |
| item | refarences | null: false foreign_key: true |

### Association
- has_one :user
- has_one :item



## address_table
| post_code        | integer    | null: false                   |
| prefecture_id    | integer    | null: false                   |
| municipality     | string     | null: false                   |
| address          | string     | null: false                   |
| buildig_name     | string     |                               |
| telephone_number | integer    | null: false                   |
| buyer            | references | null: false foreign_key: true |


### Association
- has_many :buyers

