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

- has_many :item_purchase
- has_many :items

## item_purchases テーブル

| Column            | Type      | Options                      |
| ------            | --------- | -----------                  |
| user              | references| null: false foreign_key: true|
| id           | string    | null: false                  |

### Association

- belongs_to :user
- belongs_to :destination

## destination テーブル

| Column           | Type      | Options       |
| ------           | ---------- | ------------ |
| post_code        | string     | null: false  |
| city             | string     | null: false  |
| house_number     | string     | null: false  |
| building_name    | string     |              |
| telephone_number | string     | unique: true |
| user             | references | null: false  |

### Association

- has_many :item_purchases

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
- belongs_to :item_purchase