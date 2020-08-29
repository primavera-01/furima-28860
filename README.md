# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| --------         | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |

### Association

- has_many :destinations
- has_one  :profile 
- has_many :items

## profiles テーブル

| Column            | Type      | Options     |
| ------            | --------- | ----------- |
| first_name        | string    | null: false |
| family_name       | string    | null: false |
| first_name_kana   | string    | null: false |
| family_name_kana  | string    | null: false |
| birth_day         | date      | null: false |
| introduction      | text      |             |
| user              |references | null: false |
### Association

- belongs_to :user

## destination テーブル

| Column           | Type       | Options      |
| ------           | ---------- | ------------ |
| post_code        | string     | null: false  |
| city             | string     | null: false  |
| house_number     | string     | null: false  |
| building_name    | string     | null: false  |
| telephone_number | string   | unique: true   |

### Association

- has_many :users

## items テーブル

| Column            | Type      | Options     |
| -------           | ----------| ----------- |
| name              | string    | null: false |
| introduction      | text      | null: false |
| price             | integer   | null: false |
| item_image_id     | integer   | null: false |
| item_condition    | integer   | null: false |
| shipping_date     | integer   | null: false |
| category_id       | integer   | null: false |
| shipping_location | integer   | null: false |

### Association

- belongs_to :user