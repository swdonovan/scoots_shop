require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  describe "validations" do
    it {is_expected.to belong_to(:category)}
    it {is_expected.to belong_to(:item)}
  end
end
