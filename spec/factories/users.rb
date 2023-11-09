FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password = 'a1' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    
    last_name {"中島"}
    first_name {"魁利"}
    furigana_last_name {"ナカシマ"}
    furigana_first_name {"カイリ"}
    birthday {"1998-07-21"}
  end
end