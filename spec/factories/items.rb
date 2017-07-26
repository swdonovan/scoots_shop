FactoryGirl.define do
  factory :item do

    sequence :title do |t|
      "#{t} title"
    end

    description "MyText"

    sequence :price do |t|
      t
    end

    image "https://jetimages.azureedge.net/md5/ad0fa3578baeba1eefdc2579ffe862f3.500"  
  end
end
