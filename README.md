## users テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |
| last_name              | string | null: false |
| first_name             | string | null: false |
| last_name_kana         | string | null: false |
| first_name_kana        | string | null: false |
| birthday               | date   | null: false |


### Association

- has_many :items
- has_one :histories

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

- belongs_to :users

## residences テーブル

| Column              | Type       | Options      |
| --------------------| ---------- | ------------ |
| postal_code         | string     | null: false, |
| town                | string     | null: false, |
| address             | string     | null: false, |
| building            | string     |
| telephone_number    | string     | null: false, |
| prefectures_id      | integer    | null: false  |
| history             | references    | null: false, foreign_key: true |


### Association

- has_one :histories


## histories テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| user                | references | null: false, foreign_key: true |
| items               | references | null: false, foreign_key: true |

### Association

- belongs_to :residences
- belongs_to :user