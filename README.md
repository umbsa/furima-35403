# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last-name       | string  | null: false |
| first-name      | string  | null: false |
| last-name-kana  | string  | null: false |
| first-name-kana | string  | null: false |
| user-birth-date | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| image              | string  | null: false |
| item-name          | string  | null: false |
| item-info          | text    | null: false |
| category           | string  | null: false |
| status             | string  | null: false |
| shipping-fee       | string  | null: false |
| item-prefecture    | string  | null: false |
| scheduled-delivery | string  | null: false |
| price              | integer | null: false |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column         | Type       | Options     |
| -------------- | ---------- | ----------- |
| card-number    | integer    | null: false |
| card-exp-month | integer    | null: false |
| card-exp-year  | integer    | null: false |
| card-cvc       | integer    | null: false |

### Association

- belongs_to :item
- belongs_to :user
- has_one    :input

## inputs テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal-code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| addresses    | string  | null: false |
| building     | string  | null: false |
| phone-number | integer | null: false |

### Association

- belongs_to :order