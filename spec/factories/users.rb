FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 4) }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    family_name           { Gimei.last.kanji }
    first_name            { Gimei.first.kanji }
    family_name_kana      { Gimei.last.katakana }
    first_name_kana       { Gimei.first.katakana }
    birth_day             { Faker::Date.between(from: '1930-01-01', to: '2015-12-31') }
  end
end
