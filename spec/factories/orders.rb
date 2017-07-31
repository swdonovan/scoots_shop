FactoryGirl.define do
  factory :order do
    submitted_at "2017-07-28 18:11:54"
    user nil

    trait :with_items do
      transient do
        item_count 3
      end

      after(:create) do |order, evaluator|
        order.items << create_list(:item, evaluator.item_count)
      end
    end
  end
end
