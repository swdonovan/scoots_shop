require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it {is_expected.to have_many(:item_categories)}
    it {is_expected.to have_many(:categories).through(:item_categories)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:description)}
    it {should validate_presence_of(:price)}
    it {should validate_presence_of(:categories)}
    it {should validate_uniqueness_of(:title)}
  end
end
