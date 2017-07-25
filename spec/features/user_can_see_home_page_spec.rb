require 'rails_helper'

RSpec.feature "User can visit home page and see a page" do
  scenario "and sees a page" do
    name = create(:dummy)

    print name
  end
end
