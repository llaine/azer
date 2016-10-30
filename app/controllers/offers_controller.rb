class OffersController < ApplicationController
  before_action :require_login
  before_action :set_offer, only: [:show]
  before_action :set_offer_for_user, only: [:edit, :update, :destroy]

  # GET /offers
  # GET /offers.json
  def index
    if search_params.present?
      @offers = SearchHelper.new(search_params).search
      @params = search_params
    else
      @offers = Offer.where(situation:'homeless').all
    end
  end

  # GET /offers/1
  # GET /offers/1.json
  def show
  end

  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    ActiveRecord::Base.transaction do
      @offer = Offer.new(offer_params)

      @offer.users << current_user
      respond_to do |format|
        if @offer.save

          # @offer.users.each do |u|
          #   ClearanceMailer.change_password(u).deliver_later
          # end

          format.html { redirect_to @offer, notice: 'Offer was successfully created.' }
          format.json { render :show, status: :created, location: @offer }
        else
          format.html { render :new }
          format.json { render json: @offer.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { render :show, status: :ok, location: @offer }
      else
        format.html { render :edit }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    respond_to do |format|
      format.html { redirect_to profile_path, notice: 'Offer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.includes(:images)
                   .includes(users: :images)
                   .includes(:place)
                   .where(id: params[:id])
                   .first
    end

    def set_offer_for_user
      @offer = current_user.offers
                   .includes(:images)
                   .includes(:place)
                   .where(id: params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:budget, :nb_wanted_people, :start_date, :end_date, :is_mock,
                                    :prefered_sex, :name, :activities, :ritual, :partying, :nature,
                                    :situation, :blocked, :never_do, :dream_flatmate,
                                    place_attributes: [:id, :nb_bathrooms, :nb_toilets, :internet, :dishwasher,
                                                        :ac, :parking, :tv, :playstation, :satellite,
                                                        :xbox, :wii, :smoking, :animals, :caution_price,
                                                        :electricity_price, :internet_price,
                                                        :heating_price, :detail, :title,
                                                        :nb_places_availables, :property_type, :surface,
                                                        :other_stuff, :monthly_rent_price, :total_price],
                                    images_attributes: [:id, :file, :caption],
                                    users_attributes: [:id, :email, :password, :sex, :orientation, :date_of_birth, :more_about_me,
                                                       :languages, :is_studying, :guilty_pleasure, :best_recipe,
                                                       :voluntary_work, :favorite_quote, :heroic_thing, :happiest_moment,
                                                       :world_better_place, :top_music, :top_movies, :top_series, :top_books,
                                                       :top_games, :hobbies, :nick_name, :first_name, :last_name, :company, :school,
                                                       :social_networks, :nationality, :three_wishes,
                                                       images_attributes: [:id, :file, :caption]])
    end

    def search_params
      params.permit(:situation, :start_date, :end_date, :min_price, :max_price)
    end
end
