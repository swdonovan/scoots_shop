require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "validations" do
    it {is_expected.to have_many(:item_categories)}
    it {is_expected.to have_many(:items).through(:item_categories)}
    it {is_expected.to validate_presence_of(:name)}
  end
end
