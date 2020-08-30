# テーブル設計

## users テーブル

| Column            | Type      | Options     |
| --------          | --------- | ----------- |
| nickname          | string    | null: false |
| email             | string    | null: false |
| password          | string    | null: false |
| first_name        | string    | null: false |
| family_name       | string    | null: false |

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
| post_code        | references | null: false  |
| city             | references | null: false  |
| house_number     | references | null: false  |
| building_name    | references |              |
| telephone_number | references | unique: true |
| users            | references | null: false  |
### Association

- has_many :users

## items テーブル

| Column            | Type      | Options     |
| -------           | ----------| ----------- |
| introduction      | text      | null: false |
| price             | integer   | null: false |
| item_image_id     | integer   | null: false |
| item_condition    | integer   | null: false |
| shipping_date     | integer   | null: false |
| category_id       | integer   | null: false |
| shipping_location | integer   | null: false |
| users             | references| null: false |

### Association

- belongs_to :user