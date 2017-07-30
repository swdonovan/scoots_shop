require 'rails_helper'

# describe "Admin can login and see they are an admin" do
#   scenario "their dashboard shows that they are an admin" do
#     @admin = User.create(username: "Bob", email: "bob@bob", password: "centrelli",
#                         role: 1)
#
#     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@admin)
#
#     visit root_path
#
#     within '.acct-dropdown-menu' do
#
#       click_link "Admin Dashboard"
#     end
#
#     expect(current_path).to eq admin_user_path(@admin)
#   end
#
#   # describe "User can not view index of companies" do
#   #   # scenario "instead they are redirected to a statistics page about companies" do
#   #   scenario "instead they are redirected to the error page" do
#   #     @user = User.create(name: "Cletus", email: "cl@etus", password: "centrelli")
#   #
#   #     allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)
#   #
#   #     visit 'admin/'
#   #
#   #   end
#   # end
# end
