FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'000aaaa'}
    password_confirmation {password}
    last_name             {'山田'}
    first_name            {'太郎'}
    last_name_katakana    {'ヤマダ'}
    first_name_katakana   {'タロウ'}
    birth                 {'19300101'}
  end
end