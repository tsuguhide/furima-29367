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



## items テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| item_name          | string  | null: false |
| detail             | string  | null: false |
| price              | integer | null: false |
| condition          | string  | null: false |
| category           | string  | null: false |
| delivery_charge    | string  | null: false |
| delivery_time      | string  | null: false |
| sending_address    | string  | null: false |


## address テーブル

| Column           | Type       | Options     |
| ---------------- | ---------- | ----------- |
| zip_code         | integer    | null: false |
| prefectures      | string     | null: false |
| municipality     | string     | null: false |
| street_address   | string     | null: false |
| building         | string     | null: false |
| telephone_number | integer    | null: false |


## order テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user_id | references | null: false |
| item_id | references | null: false |
