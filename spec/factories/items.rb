FactoryGirl.define do
  factory :item do

    sequence :title do |t|
      "#{t} title"
    end

    description "MyText"

    sequence :price do |t|
      t
    end
  end
end
