class ProfilesController < ApplicationController
  before_action :require_login, except: [:public]
  before_action :set_profile, only: [:show, :edit]

  def public
    @profile = User.where(id: params[:id]).joins(:images).first
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if current_user.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: current_user }
      else
        format.html { render :edit }
        format.json { render json: current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_profile
    @profile = current_user
  end

  def profile_params
    params.require(:user).permit(:email, :password, :sex, :orientation, :date_of_birth, :more_about_me,
                                 :languages, :is_studying, :guilty_pleasure, :best_recipe,
                                 :voluntary_work, :favorite_quote, :heroic_thing, :happiest_moment,
                                 :world_better_place, :top_music, :top_movies, :top_series, :top_books,
                                 :top_games, :hobbies, :nick_name, :first_name, :last_name, :company, :school,
                                 :social_networks, :nationality, :three_wishes,
                                 images_attributes: [:id, :file, :caption])
  end
end
