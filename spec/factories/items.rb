FactoryBot.define do
  factory :item do
    id                   {"1"}
    name                 {"田中"}
    explain              {"1年の田中くん"}
    category_id          {"5"}
    item_status_id       {"2"}
    sending_charge_id    {"3"}
    sending_region_id    {"3"}
    sending_day_id       {"3"}
    price                {"1000"}
    association :user
  end
end