FactoryGirl.define do
  factory :user do
    username "MyString"
    address "MyString"
    email "MyString"
    role 0
    password "MyString"

    factory :admin do
      username 'admin_dude'
      email 'admin@scoots.com'
      role 1
    end
  end
end
