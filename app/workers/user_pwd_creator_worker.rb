class UserPwdCreatorWorker
  include Sidekiq::Worker
  def perform(user)
    ClearanceMailer.change_password(user).deliver_later
  end
end

