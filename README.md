# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| email              | string     | null: false |
| password           | string     | null: false |
| encrypted_password | string     | null: false |
| nickname           | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| birth_year_id      | integer    | null: false |
| birth_month_id     | integer    | null: false |
| birth_day_id       | integer    | null: false |

### Association

- has_many : buy_items
- has_many : items
- belongs_to : address

 ## items テーブル

| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| product            | string     | null: false |
| image              | ActiveStorageで管理      |
| genre_id           | integer    | null: false |
| text               | text       | null: false |
| condition_id       | integer    | null: false |
| price              | integer    | null: false |
| charge_id          | integer    | null: false |
| area_id            | integer    | null: false |
| day_id             | integer    | null: false |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : address

## addresses テーブル

| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| postal_code        | string     | null: false |
| prefecture_id      | integer    | null: false |
| municipality       | string     | null: false |
| house_num          | string     | null: false |
| building           | string     |             |
| tel                | integer    | null: false |

### Association

- has_many : buy_items
- belongs_to : user
- belongs_to : item

## buy_items テーブル
| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- belongs_to : address