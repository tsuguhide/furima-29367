FactoryBot.define do
  factory :user do
    nick_name             { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { '山田' }
    first_name            { '陸太郎' }
    furigana_family_name  { 'ヤマダ' }
    furigana_first_name   { 'リクタロウ' }
    birthday              { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end

# 備忘録：gem"gimei"でフリガナも生成できそう
# 以下は念の為残してるだけ

# factory :user do
#  nick_name             {"yama"}
#  email                 {"kkk@gmail.com"}
#  password              {"aaa000"}
#  password_confirmation {password}
#  family_name           {"山田"}
#  first_name            {"陸太郎"}
#  furigana_family_name  {"ヤマダ"}
#  furigana_first_name   {"リクタロウ"}
#  birthday              {"1960-01-01"}
# end
# family_name           {Faker::Name.last_name}
# first_name            {Faker::Name.first_name}

# user = User.new(nick_name: "", email: "kkk@gmail.com", password: "aaa000", password_confirmation: "aaa000",
#  family_name: "山田", first_name: "陸太郎", furigana_family_name: "ヤマダ", furigana_first_name: "リクタロウ", birthday: "1960-01-01")
