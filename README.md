
## user テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| user_id             | string  | null: false |
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
- has_many :purchase
- has_many :user_item
- belongs_to_active_hash :pulldown

## item テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| item_name         | string  | null: false |
| item_name         | string  | null: false |
| item_explain      | text    | null: false |
| price             | integer | null: false |
| image             | text    | null: false |
| category_id       | integer | null: false |
| item_status_id    | integer | null: false |
| sending_charge_id | integer | null: false |
| sending_region_id | integer | null: false |
| sending_day_id    | integer | null: false |

### Association

- belongs_to :user
- belongs_to :purchase
- has_many :user_item
- belongs_to_active_hash :pulldown

## purchase テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| user_item_id   | integer | null: false |
| postal_code    | string  | null: false |
| phone_number   | string  | null: false |
| city           | string  | null: false |
| address        | string  | null: false |
| building_name  | string  | null: false |
| prefectures_id | integer | null: false |

### Association

- has_many :user
- has_many :item
- belongs_to :user_item
- belongs_to_active_hash :pulldown

## user_item テーブル

| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| user_id    | integer | null: false |
| item_id    | integer | null: false |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :user_item