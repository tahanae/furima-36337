# README

## users_table
| Column             | Type     | Option                        |
| -------------------| -------- | ----------------------------- |
| name               | string   | null: false                   |
| email              | string   | null: false, unique: true     |
| encrypted_password | string   | null: false                   |
| first_name         | string   | null: false                   |
| last_name          | string   | null: false                   |
| first_name_furigana | string  | null: false                   |
| last_name_furigana | string   | null: false                   |
| date_of_birth      | date     | null: false                   |

### Association
has_many :items
has_many :buyers



## items_table
| Column             | Type       | Option                        |
| ------------------ | ---------- | ----------------------------- |
| title              | string     | null: false                   |
| explanation        | text       | null: false                   |
| category_id        | integer    | null: false                   |
| condition_id       | integer    | null: false                   |
| ScheduledDelivery_id | integer    | null: false                   |
| area_id            | integer    | null: false                   |
| shipping_day_id    | integer    | null: false                   |
| price              | integer    | null: false                   |
| user               | references | null: false foreign_key: true |

### Association
- belongs_to :user
- has_one :buyer



## buyers_table
| user | references | null: false foreign_key: true |
| item | references | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :adrress


## addresses_table
| post_code        | string     | null: false                   |
| area_id          | integer    | null: false                   |
| municipality     | string     | null: false                   |
| address          | string     | null: false                   |
| buildig_name     | string     |                               |
| telephone_number | string     | null: false                   |
| buyer            | references | null: false foreign_key: true |


### Association
- belongs_to :buyer

