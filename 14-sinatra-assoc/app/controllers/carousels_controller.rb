class CarouselsController < ApplicationController
  get "/carousels" do
    @carousels = Carousel.all
    erb :index
  end
 
  get "/carousels/:id" do
    @carousel = Carousel.find(params[:id])
    erb :'/carousels/show' # /app/views/carousels/show.erb
    # erb :show # /app/views/show.erb
  end
end