# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column               | Type   | Options     |
| -------------------- | ------ | ----------- |
| nick_name            | string | null: false |
| mail_address         | string | null: false |
| family_name          | string | null: false |
| first_name           | string | null: false |
| furigana_family_name | string | null: false |
| furigana_first_name  | string | null: false |
| birthday             | date   | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| item_name          | string     | null: false                    |
| detail             | text       | null: false                    |
| price              | integer    | null: false                    |
| condition_id       | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| delivery_time_id   | integer    | null: false                    |
| sending_address_id | integer    | null: false                    |
| user               | references | null: false , foreign_key: true|


### Association

- belongs_to :user
- has_one :order

## addresses テーブル

| Column           | Type       | Options                         |
| ---------------- | ---------- | ------------------------------- |
| zip_code         | string     | null: false                     |
| prefectures_id   | integer    | null: false                     |
| municipality     | string     | null: false                     |
| street_address   | string     | null: false                     |
| building         | string     |                                 |
| telephone_number | string     | null: false                     |
| order            | references | null: false , foreign_key: true |


### Association

- belongs_to :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false , foreign_key: true|
| item    | references | null: false , foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :address