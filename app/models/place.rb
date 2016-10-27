class Place < ApplicationRecord
  belongs_to :offer, required: false
end
