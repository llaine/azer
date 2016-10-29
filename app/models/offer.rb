class Offer < ApplicationRecord
  has_many :teams, dependent: :destroy
  has_many :users, through: :teams, dependent: :destroy
  has_many :images, as: :imageable, dependent: :destroy
  has_many :channels, dependent: :destroy
  has_one :place, dependent: :destroy

  accepts_nested_attributes_for :place, :images, :users

  after_create_commit :create_channel

  def self.default_scope
    where(blocked:false).group('offers.id, offers.created_at').order('offers.created_at DESC')
  end

  private

  def create_channel
    # crée une conversation, on ajoute les users dedans
    title = "Offer : #{self.name}, #{self.budget} #{self.start_date} #{self.end_date}"
    # current connected user, is always the last inserted
    current_user_id = self.users.last.id
    Channel.create!(user_id: current_user_id, title: title, offer_id: self.id)
  end
end
