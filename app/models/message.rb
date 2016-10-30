class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit {
    MessageBroadcastWorker.perform_async(self.id)
  }

  def timestamp
    created_at.strftime('%m/%d/%Y - %H:%M')
  end
end
