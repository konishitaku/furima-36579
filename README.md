## users テーブル

| Column                 | Type   | Options     |
| ------------------     | ------ | ----------- |
| nickname               | string | null: false |
| email                  | string | null: false |
| encrypted_password     | string | null: false |
| name                   | string | null: false |
| name_kana              | string | null: false |
| birthday               | date   | null: false |


### Association

- has_many :items
- has_many :purchase

## items テーブル

| Column                    | Type   | Options     |
| --------------------------| ------ | ----------- |
| image                     | string | null: false |
| merchandise               | string | null: false |
| text                      | text   | null: false |
| category                  | string | null: false |
| status                    | string | null: false |
| load                      | string | null: false |
| day                       | date   | null: false |
| price                     | string | null: false |


### Association

- belongs_to :users
- has_one :purchase

## purchase テーブル

| Column              | Type       | Options                        |
| --------------------| ---------- | ------------------------------ |
| postal_code         | string     | null: false, foreign_key: true |
| area                | string     | null: false, foreign_key: true |
| town                | string     | null: false, foreign_key: true |
| address             | string     | null: false, foreign_key: true |
| building            | string     | null: false, foreign_key: true |
| telephone_number    | string     | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :items
