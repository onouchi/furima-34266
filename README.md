# テーブル設計

## users テーブル

| Column                | Type    | Options                  |
| --------------------- | ------- | ------------------------ |
| nickname              | string  | null: false              |
| email                 | string  | null: false, unique: true|
| encrypted_password    | string  | null: false              |
| last_name             | string  | null: false              |
| first_name            | string  | null: false              |
| last_name_katakana    | string  | null: false              |
| first_name_katakana   | string  | null: false              |
| birth                 | date    | null: false              |


### Association

- has_many :items
- has_many :purchases
- has_many :comments


## items テーブル

| Column                       | Type           | Options                        |
| ---------------------------- | -------------- | ------------------------------ |
| title                        | string         | null: false                    |
| image                        | ActiveStorage  | 
| price                        | integer        | null: false                    |
| delivery_charged_id          | integer        | null: false                    |
| text                         | text           | null: false                    |
| user                         | references     | foreign_key: true              |
| category_id                  | integer        | null: false                    |
| product_condition_id         | integer        | null: false                    |
| prefecture_id                | integer        | null: false                    |
| estimated_shipping_date_id   | integer        | null: false                    |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## purchases テーブル

| Column                       | Type           | Options           |
| ---------------------------- | -------------- | ----------------- |
| user                         | references     | foreign_key: true |
| item                         | references     | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping address テーブル
| postal_code                  | string         | null: false       |
| prefectures                  | integer        | null: false       |
| municipality                 | string         | null: false       |
| address(banchi)              | string         | null: false       |
| building_name                | string         | 
| phone_number                 | string         | null: false       |
| purchase                     | references     |  

### Association

- belongs_to :purchase

## comments テーブル

| Column       | Type       | Options           |
| ------------ | ---------- | ----------------- |
| text         | text       | null: false       |
| user         | references | 
| item         | references |

### Association

- belongs_to :user
- belongs_to :item

