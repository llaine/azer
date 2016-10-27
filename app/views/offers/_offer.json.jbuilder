json.extract! offer, :id, :budget, :nb_wanted_people, :start_date, :end_date, :is_mock, :prefered_sex,
              :name, :activities, :ritual, :partying, :nature, :situation, :blocked, :never_do,
              :dream_flatmate, :created_at,
              :updated_at
json.url offer_url(offer, format: :json)
