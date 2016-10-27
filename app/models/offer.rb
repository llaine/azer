class Offer < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :users, through: :teams, dependent: :destroy

  has_many :images, as: :imageable, dependent: :destroy
  has_one :place, dependent: :destroy

  accepts_nested_attributes_for :place, :images, :users
end
