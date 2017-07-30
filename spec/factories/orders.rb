FactoryGirl.define do
  factory :order do
    status "MyString"
    resolved_at "2017-07-28 18:11:54"
    submitted_at "2017-07-28 18:11:54"
    user nil

    trait :with_items do
      transient do
        item_count 3
      end
    end
  end
end
