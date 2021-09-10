## users テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | unique: true|
| encrypted_password     | string | null: false |
| last name              | string | null: false |
| first name             | string | null: false |
| last name_kana         | string | null: false |
| first name_kana        | string | null: false |
| birthday               | date   | null: false |


### Association

- has_many :items

## items テーブル

| Column                    | Type   | Options     |
| --------------------------| ------ | ----------- |
| merchandise               | string | null: false |
| text                      | text   | null: false |
| category_2                | integer | null: false |
| status_3                  | integer | null: false |
| area_4                    | integer | null: false |
| load_5                    | integer | null: false |
| day_6                     | integer | null: false |
| price                     | integer | null: false |
| user_id                   | string  | null: false, foreign_key: true |


### Association

- belongs_to :users

## residences テーブル

| Column              | Type       | Options      |
| --------------------| ---------- | ------------ |
| postal_code         | string     | null: false, |
| town                | string     | null: false, |
| address             | string     | null: false, |
| building            | string     | null: false, |
| telephone_number    | string     | null: false, |
| prefectures_7       | integer    | null: false  |
| history_id          | string     | null: false, foreign_key: true |


### Association

- has_many :histories


## histories テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| user_id             | string     | null: false, foreign_key: true |
| items_id            | string     | null: false, foreign_key: true |

### Association

- belongs_to :residences