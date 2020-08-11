
## user テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| first_name          | string  | null: false |
| last_name           | string  | null: false |
| first_name_phonetic | string  | null: false |
| last_name_phonetic  | string  | null: false |
| birth_date          | date    | null: false |

### Association

- has_many :items
- has_many :user_items

## item テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| name              | string  | null: false |
| explain           | text    | null: false |
| price             | integer | null: false |
| image             | string  | null: false |
| category_id       | integer | null: false |
| item_status_id    | integer | null: false |
| sending_charge_id | integer | null: false |
| sending_region_id | integer | null: false |
| sending_day_id    | integer | null: false |
| user_id           | integer | null: false,foreign_key: true |

### Association

- belongs_to :user
- has_many :user_items

## address テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| user_item_id   | integer | null: false,foreign_key: true |
| postal_code    | string  | null: false |
| phone_number   | string  | null: false |
| city           | string  | null: false |
| address        | string  | null: false |
| building_name  | string  |             |
| prefectures_id | integer | null: false |

### Association

- belongs_to :user_item

## user_item テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| user_id    | integer | null: false |
| item_id    | integer | null: false |

### Association

- has_one :address