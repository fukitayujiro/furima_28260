
## users テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| birth_year_id   | integer | null: false |
| birth_month_id  | integer | null: false |
| birth_date_id   | integer | null: false |

### Association

- has_many :items
- has_many :purchase
- belongs_to_active_hash :pulldown

## item テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
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
- belongs_to_active_hash :pulldown

## purchase テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal_code    | string  | null: false |
| phone_number   | integer | null: false |
| city           | string  | null: false |
| address        | string  | null: false |
| building_name  | string  | null: false |
| prefectures_id | integer | null: false |

### Association

- has_many :user
- has_many :item
- belongs_to_active_hash :pulldown