## usersテーブル
| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| nickname              | string   | null: false               |
| email                 | string   | null: false, unique: true |
| encrypted_password    | string   | null: false               |
| last_name             | string   | null: false               |
| first_name            | string   | null: false               |
| last_name_kana        | string   | null: false               |
| first_name_kana       | string   | null: false               |
| date                  | datetime | null: false               |

### Association
- has_many :items
- has_many :order


## itemsテーブル
| Column                  | Type      | Options                        |
| ----------------------- | --------- | ------------------------------ |
| item_name               | string    | null: false                    |
| item_info               | text      | null: false                    |
| item_category           | string    | null: false                    |
| item_sales_status       | string    | null: false                    |
| prefecture_id           | integer   | null: false                    |
| item_scheduled_delivery | string    | null: false                    |
| item_price              | integer   | null: false                    |
| add_tax_price           | integer   | null: false                    |
| profit                  | integer   | null: false                    |
| user                    | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order


## ordersテーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| user         | reference | null: false, foreign_key: true |
| item         | reference | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping_addresses


## shipping_addressesテーブル
| Column        | Type      | Options                        |
| ------------- | --------- | ------------------------------ |
| postal_code   | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| city          | string    | null: false                    |
| addresses     | string    | null: false                    |
| building      | string    |                                |
| phone_number  | string    | null: false                    |
| order         | reference | null: false, foreign_key: true |


### Association
- belongs_to :order