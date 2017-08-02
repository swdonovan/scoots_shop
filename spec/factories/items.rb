FactoryGirl.define do

  factory :item do

    sequence :title do |t|
      "#{t} title"
    end

    sequence :description do |t|
      "#{t} description"
    end

    sequence :price do |t|
      t
    end

    before(:create) do |item|
      item.categories << create(:category)
    end

  end
end
