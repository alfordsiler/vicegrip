class Vice < ApplicationRecord
  belongs_to :user

  has_many :setbacks
  accepts_nested_attributes_for :setbacks
end
