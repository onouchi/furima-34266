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
| birth_year            | integer | null: false              |
| birth_month           | integer | null: false              |
| birth_day             | integer | null: false              |

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
| user                         | references     | 
| category_id                  | integer        | null: false, foreign_key: true |
| product_condition_id         | integer        | null: false                    |
| prefectures_id               | integer        | null: false                    |
| estimated_shipping_date_id   | integer        | null: false                    |

### Association

- belongs_to :user
- has_one :purchase
- has_many :comments

## purchases テーブル

| Column                       | Type           | Options     |
| ---------------------------- | -------------- | ----------- |
| title                        | references     | 
| image                        | references     | 
| price                        | references     | 
| delivery_charged             | references     | 
| user                         | references     | 
| item                         | references     | 

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping_address


## shipping address テーブル
| postal_code                  | integer        | null: false |
| prefectures                  | string         | null: false |
| municipality                 | string         | null: false |
| address(banchi)              | string         | null: false |
| building_name                | string         | null: false |
| phone_number                 | string         | null: false |
| user                         | references     |
| purchase                     | references     |  

### Association

- belongs_to

## comments テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| text         | text       | null: false |
| user         | references |
| item         | references |

### Association

- belongs_to :user
- belongs_to :item

