class TrainersController < ApplicationController

  def index
    @trainer = Trainer.all
    # USE EXCEPT AND NOT EXCLUDE
    render json: @trainer, include: [:pokemons], except: [:created_at, :updated_at]
  end

end
