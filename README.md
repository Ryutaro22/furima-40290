## usersテーブル
| Column                | Type     | Options                   |
| --------------------- | -------- | ------------------------- |
| nickname              | string   | null: false               |
| email                 | string   | null: false, unique: true |
| password              | string   | null: false               |
| password-confirmation | string   | null: false               |
| last-name             | string   | null: false               |
| first-name            | string   | null: false               |
| last-name-kana        | string   | null: false               |
| first-name-kana       | string   | null: false               |
| birth-date            | datetime | null: false               |

### Association
- has_many :items
- has_many :comments
- has_many :order


## itemsテーブル
| Column                  | Type      | Options                        |
| ----------------------- | --------- | ------------------------------ |
| item-name               | string    | null: false                    |
| item-info               | text      | null: false                    |
| item-category           | string    | null: false                    |
| item-sales-status       | string    | null: false                    |
| item-prefecture         | string    | null: false                    |
| item-scheduled-delivery | string    | null: false                    |
| item-price              | integer   | null: false                    |
| add-tax-price           | integer   | null: false                    |
| profit                  | integer   | null: false                    |
| user                    | reference | null: false, foreign_key: true |

### Association
- has_many :comments
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
- has_one :shipping


## shipping-addressテーブル
| Column       | Type      | Options                        |
| ------------ | --------- | ------------------------------ |
| postal-code  | integer   | null: false                    |
| prefecture   | string    | null: false                    |
| city         | string    | null: false                    |
| addresses    | string    | null: false                    |
| building     | string    |                                |
| phone-number | string    | null: false                    |

### Association
- belongs_to :order