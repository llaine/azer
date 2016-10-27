class CrewMergerController < ApplicationController
  def join_crew
    UserAdderService.new(params[:id], current_user).join_crew

    flash[:notice] = 'Youve been added to this crew'

    redirect_to "/offers/#{params[:id]}"
  end

  def leave_crew
    UserAdderService.new(params[:id], current_user).leave_crew

    flash[:notice] = 'Youve been removed from this crew'

    redirect_to "/offers/#{params[:id]}"
  end
end
