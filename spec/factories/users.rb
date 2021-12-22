FactoryBot.define do
  factory :user do
    name                  {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {'山田'}
    last_name             {'太郎'}
    first_name_furigana   {'ヤマダ'}
    last_name_furigana    {'タロウ'}
    date_of_birth         {'2000-01-01'}
  end
end