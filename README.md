# テーブル設計

## users テーブル

| Column            | Type      | Options     |
| --------          | --------- | ----------- |
| nickname          | string    | null: false |
| email             | string    | null: false |
| password          | string    | null: false |
| first_name        | string    | null: false |
| family_name       | string    | null: false |
| first_name_kana   | string    | null: false |
| family_name_kana  | string    | null: false |
| birth_day         | date      | null: false |
### Association

- has_many :transactions
- has_many :items

## transaction テーブル

| Column            | Type      | Options     |
| ------            | --------- | ----------- |
| users             | string    | null: false |
| category          | string    | null: false |
| item_condition    | string    | null: false |
| shipping_charge   | string    | null: false |
| consignor         | string    | null: false |
| shipping_date     | string    | null: false |

### Association

- belongs_to :user

## destination テーブル

| Column           | Type       | Options      |
| ------           | ---------- | ------------ |
| post_code        | string     | null: false  |
| city             | string     | null: false  |
| house_number     | string     | null: false  |
| building_name    | string     |              |
| telephone_number | string     | unique: true |
| users            | references | null: false  |
### Association

- has_many :users

## items テーブル

| Column            | Type      | Options                      |
| ------------------| ----------| ---------------------------  |
| name              | string    | null:false                   |
| introduction      | text      | null: false                  |
| price             | integer   | null: false                  |
| image_id          | integer   | null: false                  |
| condition         | integer   | null: false                  |
| shipping_date     | integer   | null: false                  |
| category_id       | integer   | null: false                  |
| shipping_location | integer   | null: false                  |
| users             | references| null: false foreign_key: true|

### Association

- belongs_to :user