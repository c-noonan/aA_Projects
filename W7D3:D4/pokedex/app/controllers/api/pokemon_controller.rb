class Api::PokemonController < ApplicationController
  def index
    @pokemon = Pokemon.all
  end

  def show
    @pokemon = Pokemon.includes(:items).find_by(id: params[:id])
    render :show
  end
end
