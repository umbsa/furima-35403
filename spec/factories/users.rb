FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a2345'}
    password_confirmation {password}
    last_name             {'佐藤'}
    first_name            {'太郎'}
    last_name_kana        {'サトウ'}
    first_name_kana       {'タロウ'}
    user_birth_date       {'1900-12-12'}
  end
end