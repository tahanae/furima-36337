# README

## users_table
| Column             | Type    | Option                        |
| -------------------| ------- | ----------------------------- |
| name               | string  | null: false                   |
| email              | string  | null: false, uniqueness: true |
| encrypted_password | string  | null: false                   |
| first_name         | string  | null: false                   |
| last_name          | string  | null: false                   |
| date_of_birth      | integer | null: false                   |

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
| user            | refarences | null: false foreign_key: true |

### Association
has_many :buyers




## buyers_table
| user | refarences | null: false foreign_key: true |
| item | refarences | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item




## buys_table
| Column           | Type       | Option                        |
| ---------------- | ---------- | ----------------------------- |
| credit_card      | string     | null: false                   |
| expiration_date  | integer    | null: false                   |
| security_code    | integer    | null: false                   |
| post_code        | integer    | null: false                   |
| prefectures      | string     | null: false                   |
| municipality     | string     | null: false                   |
| address          | string     | null: false                   |
| buildig_name     | string     |                               |
| telephone_number | integer    | null: false                   
| user             | refarences | null: false foreign_key: true |
| item             | refarences | null: false foreign_key: true |

### Association
- bolongs_to :user
- belongs_to :item


