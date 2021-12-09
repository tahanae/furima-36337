# README

## users_table
| Column             | Type   | Option      |
| -------------------| ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association
has_many :items
has_many :buyers, thouth: :buys



## items_table
| Column          | Type      | Option                        |
| --------------- | --------- | ----------------------------- |
| title           | string    | null: false                   |
| explanation     | text      | null: false                   |
| category        | boolean   | null: false                   |
| condition       | boolean   | null: false                   |
| derivery_charge | boolean   | null: false                   |
| area            | boolean   | null: false                   |
| day             | datetime  | null: false                   |
| price           | integer   | null: false                   |
| comment         | text      | null: false                   |
| user            | refarence | null: false foreign_key: true |

### Association
has_many :items
has_many :buyers, thouth: :buys




## buyers_table
| user | refarence | null: false foreign_key: true |
| item | refarence | null: false foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item




## buys_table
| Column           | Type      | Option                        |
| ---------------- | --------- | ----------------------------- |
| credit           | string    | null: false                   |
| shipping_address | string    | null: false                   |
| user             | refarence | null: false foreign_key: true |
| item             | refarence | null: false foreign_key: true |

### Association
- bolongs_to :user
- belongs_to :item


