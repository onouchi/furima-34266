# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| prefectures  | string | null: false |

## items テーブル

| Column                       | Type           | Options     |
| ---------------------------- | -------------- | ----------- |
| title                        | string         | null: false |
| image                        | ActiveStorage  | 
| price                        | integer        | null: false |
| delivery_charged             | string         | null: false |
| text                         | text           | null: false |
| seller_user                  | reference      | 
| category                     | string         | null: false |
| product_condition            | string         | null: false |
| prefectures                  | reference      | 
| estimated_shipping_date      | string         | null: false |


## purchases テーブル

| Column                       | Type           | Options     |
| ---------------------------- | -------------- | ----------- |
| title                        | reference      | 
| image                        | reference      | 
| price                        | reference      | 
| delivery_charged             | reference      | 
| credit_card_number           | integer        | null: false |
| credit_card_expiration_date  | integer        | null: false |
| credit_card_security_code    | integer        | null: false |
| postal_code                  | integer        | null: false |
| prefectures                  | string         | null: false |
| municipality                 | string         | null: false |
| address(banchi)              | string         | null: false |
| building_name                | string         | null: false |
| phone_number                 | string         | null: false |


## comments テーブル

| Column       | Type       | Options     |
| ------------ | ---------- | ----------- |
| text         | text       | null: false |
| user         | references |
| item         | references |