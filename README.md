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

- has_many :item_purchases
- has_many :items

## item_purchases テーブル

| Column            | Type      | Options                      |
| ------            | --------- | -----------                  |
| user              | references| null: false foreign_key: true|
| item              | references| null: false foreign_key: true|

### Association

- belongs_to :user
- belongs_to :destination
- belongs_to :item

## destination テーブル

| Column           | Type      | Options       |
| ------           | ---------- | ------------ |
| prefecture       | integer    | null:false   |
| post_code        | string     | null: false  |
| city             | string     | null: false  |
| house_number     | string     | null: false  |
| building_name    | string     |              |
| telephone_number | string     | unique: true |
| item_purchase    | references | null: false  |

### Association

- belongs_to :item_purchase

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
| user              | references| null: false foreign_key: true|

### Association

- belongs_to :user
- has_one    :item_purchase