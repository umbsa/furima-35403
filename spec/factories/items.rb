FactoryBot.define do
  factory :item do
    name                  {'ドラえもん'}
    info                  {'ドラミちゃん'}
    category_id           {2}
    status_id             {2}
    shipping_fee_id       {2}
    prefecture_id         {2}
    scheduled_delivery_id {2}
    price                 {300}
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/apple-touch-icon.png'), filename: 'apple-touch-icon.png')
    end
  end
end
