class HorsesController < ApplicationController
  get "/horses/new" do
    @carousels = Carousel.all
    erb :new
  end

  post "/horses" do
    horse = Horse.create(params)

    redirect to("/horses/#{horse.id}")
    # horse = Horse.create({
    #   name: params[:name], 
    #   color: params[:colors],
    #   carousel_id: params[:carousel_id]}) # Mass Assignment
    binding.pry
  end

  get "/horses/:id" do
    @horse = Horse.find(params[:id])
    erb :show
  end
end