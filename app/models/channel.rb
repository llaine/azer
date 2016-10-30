class Channel < ApplicationRecord
  belongs_to :user
  belongs_to :offer
  has_many :messages, dependent: :destroy
end
