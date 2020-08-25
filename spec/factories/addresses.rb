FactoryBot.define do
  factory :address do
    id                   {"1"}
    postal_code          {"111-1111"}
    phone_number         {"08011112222"}
    city                 {"南区南"}
    addresses            {"1-1-1"}
    prefectures_id       {"3"}
    association :user_item
  end
end
