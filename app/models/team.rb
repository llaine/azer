class Team < ApplicationRecord
  belongs_to :offer, required: false
  belongs_to :user, required: false
end
