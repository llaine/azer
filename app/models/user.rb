class User < ApplicationRecord
  include Clearance::User
  has_many :teams
  has_many :offers, through: :teams

  has_many :images, as: :imageable, dependent: :destroy
  accepts_nested_attributes_for  :images

end
