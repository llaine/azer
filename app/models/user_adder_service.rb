class UserAdderService

  attr_accessor :offer, :user

  def initialize(offer_id, user)
    @offer = Offer.where(id: offer_id).first
    @user = user
  end

  def join_crew
    if @offer.present?
      unless @offer.users.include? user
        @offer.users << user
      end
    end
  end


  def leave_crew
    if @offer.present?
      team = Team.where(offer_id: @offer.id, user: user.id).first
      team.destroy!
    end
  end
end
