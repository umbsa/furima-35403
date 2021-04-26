# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false,              |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last-name          | string  | null: false               |
| first-name         | string  | null: false               |
| last-name-kana     | string  | null: false               |
| first-name-kana    | string  | null: false               |
| user-birth-date    | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| item-name             | string     | null: false                    |
| item-info             | text       | null: false                    |
| category_id           | integer    | null: false                    |
| status_id             | integer    | null: false                    |
| shipping-fee_id       | integer    | null: false                    |
| prefecture_id         | integer    | null: false                    |
| scheduled-delivery_id | integer    | null: false                    |
| price                 | integer    | null: false                    |
| user                  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :order

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |


### Association

- belongs_to :item
- belongs_to :user
- has_one    :input

## inputs テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal-code   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| addresses     | string     | null: false                    |
| building      | string     |                                |
| phone-number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |

### Association

- belongs_to :order