class User < ApplicationRecord
  has_secure_password

  has_many :orders

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true

  enum role: [:guest, :admin]

  before_create :name_split

  def name_split
    if self.full_name
      self.first_name = self.full_name.split(' ').first
      self.last_name = self.full_name.split(' ').last
    end
  end
end
