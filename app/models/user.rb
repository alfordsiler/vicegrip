class User < ApplicationRecord
  has_many :vices
  accepts_nested_attributes_for :vices

  validates :name,
  presence: true

  validates :email,
  presence: true,
  uniqueness: {case_sensitive: false}

  validates :password,
  length: { in: 6..72 },
  on: :create

  has_secure_password

  def self.authenticate(params)
    User.find_by_email(params[:email]).try(:authenticate, params[:password])
  end

end
