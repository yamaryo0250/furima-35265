# テーブル設計

## users テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| email              | string     | null: false, unique: true |
| encrypted_password | string     | null: false |
| nickname           | string     | null: false |
| last_name          | string     | null: false |
| first_name         | string     | null: false |
| last_kana          | string     | null: false |
| first_kana         | string     | null: false |
| birthday           | date       | null: false |

### Association

- has_many : orders
- has_many : items

 ## items テーブル

| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| product            | string     | null: false |
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
- has_one : order

## addresses テーブル

| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| postal_code        | string     | null: false |
| area_id            | integer    | null: false |
| municipality       | string     | null: false |
| house_num          | string     | null: false |
| building           | string     |             |
| tel                | string     | null: false |

### Association

- belongs_to : order

## orders テーブル
| Column             | Type       | Options     |
| -------------------| -----------| ----------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one    : address
- belongs_to : item