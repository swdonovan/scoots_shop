require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "validations" do
    it {is_expected.to have_many(:item_categories)}
    it {is_expected.to have_many(:categories).through(:item_categories)}
  end
end
