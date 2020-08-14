FactoryBot.define do
  factory :user do
    nickname              {"yamada"}
    email                 {"yamada@gmail.com"}
    password              {"yamada123"}
    password_confirmation {password}
    first_name            {"山田"}
    last_name             {"太郎"}
    first_name_kana       {"ヤマダ"}
    last_name_kana        {"タロウ"}
    birth_date            {"1988-10-10"}
  end
end