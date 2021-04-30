FactoryBot.define do
  factory :order_input do
    postal_code   {'123-4567'}
    prefecture_id {14}
    city          {'練馬区月見台'}
    addresses     {'すすきヶ原2-23'}
    phone_number  {"09012345678"}
    token {"tok_abcdefghijk00000000000000000"}
    association :item
    association :user
  end
end
