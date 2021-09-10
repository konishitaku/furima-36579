## users テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false ,unique: true |
| encrypted_password     | string | null: false |
| last_name              | string | null: false |
| first_name             | string | null: false |
| last_name_kana         | string | null: false |
| first_name_kana        | string | null: false |
| birthday               | date   | null: false |


### Association

- has_many :items
- has_many :histories

## items テーブル

| Column                    | Type   | Options     |
| --------------------------| ------ | ----------- |
| merchandise               | string | null: false |
| text                      | text   | null: false |
| category_id               | integer | null: false |
| status_id                 | integer | null: false |
| area_id                   | integer | null: false |
| load_id                   | integer | null: false |
| day_id                    | integer | null: false |
| price                     | integer | null: false |
| user                      |references  | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :history

## residences テーブル

| Column              | Type       | Options      |
| --------------------| ---------- | ------------ |
| postal_code         | string     | null: false, |
| town                | string     | null: false, |
| address             | string     | null: false, |
| building            | string     |
| telephone_number    | string     | null: false, |
| area_id             | integer    | null: false  |
| history             | references    | null: false, foreign_key: true |


### Association

- belongs_to :history


## histories テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| item                | references | null: false, foreign_key: true |

### Association

- has_one :residence
- belongs_to :user
- belongs_to item