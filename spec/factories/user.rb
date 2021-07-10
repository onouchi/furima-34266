FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { '000aaa' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_katakana    { 'ヤマダ' }
    first_name_katakana   { 'タロウ' }
    birth                 { '19300101' }
  end

  factory :buyer, class: User do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { '000aaa' }
    password_confirmation { '000aaa' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_katakana    { 'ヤマダ' }
    first_name_katakana   { 'タロウ' }
    birth                 { '19300101' }
  end
end
