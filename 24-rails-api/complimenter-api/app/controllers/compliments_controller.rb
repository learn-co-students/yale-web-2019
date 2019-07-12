class ComplimentsController < ApplicationController
  def index
    compliments = Compliment.all
    render json: ComplimentSerializer.new(compliments).serialized_json # render this as JSON
  end

  def beef
    render json: {message: "beef"}
  end

  def create
    # Request Method => POST
    # URL => /compliments

    # byebug
    compliment = Compliment.create(compliment_params)
    render json: compliment
  end

  def update
    # PATCH
    # /compliments/:id

    compliment = Compliment.find(params[:id])
    compliment.update(compliment_params)
    render json: compliment
  end

  def destroy
    # DELETE
    # /compliments/:id
    compliment = Compliment.find(params[:id])
    compliment.destroy
    
  end

  private
  def compliment_params
    params.permit(:message, :hug_count)
  end
end