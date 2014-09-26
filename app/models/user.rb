class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, uniqueness: true, email_format: true
  has_one :profile
  has_many :auction, dependent: :destroy

  accepts_nested_attributes_for :profile, allow_destroy: true

  delegate :full_name, to: :profile

end
