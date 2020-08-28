# テーブル設計

## login テーブル

| Column    | Type   | Options     |
| --------  | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |

### Association

- has_many :destination
- has_many :users 
- has_many :items

## users テーブル

| Column           | Type   | Options     |
| ------           | ------ | ----------- |
| first_name       | string | null: false |
| family_name      | string | null: false |
| first_name_kana  | string | null: false |
| family_name_kana | string | null: false |
| birthday         | date   | null: false |

### Association

- belongs_to :login

## destination テーブル

| Column           | Type       | Options                        |
| ------           | ---------- | ------------------------------ |
| post_code        | string     | null: false, foreign_key: true |
| city             | string     | null: false, foreign_key: true |
| house_number     | string     | null: false,                   |
| building_name    | string     | null: false,                   |
| telephone_number | interger   | unique: true                   |

### Association

- has_many :login

## items テーブル

| Column            | Type       | Options                        |
| -------           | ---------- | ------------------------------ |
| name              | string     | null: false, foreign_key: true |
| introduction      | string     | null: false, foreign_key: true |
| price             | text       | null: false, foreign_key: true |
| item_image_id     | references | null: false, foreign_key: true |
| item_condition    | references | null: false, foreign_key: true |
| shipping_date     | references | null: false, foreign_key: true |
| category_id       | references | null: false, foreign_key: true |
| shipping_location | references | null: false, foreign_key: true |

### Association

- belongs_to :users