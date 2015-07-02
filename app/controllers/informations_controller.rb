class InformationsController < ApplicationController

  def cities
    render :json => City.where(state_id: params[:state])
  end
end
