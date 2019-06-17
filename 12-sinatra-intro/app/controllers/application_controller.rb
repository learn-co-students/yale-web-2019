require './config/environment'

class ApplicationController < Sinatra::Base

  # Configuration logic
  configure do
    set :public_folder, 'public' # Apply anything in the public folder
    set :views, 'app/views' # Make sure all of our views are in the app/views folder
  end

  # What type of request are we making: GET
  # What is the path to this request: "/"
  get "/" do
    erb :welcome
  end

  get "/hello_world" do 
    # Everythig inside here is what should 
    # I do for the user
    erb :welcome
  end


  # Routes
  get "/foods" do
    # All the foods in my database
    @foods = Food.all
    erb :index # "index.erb"
  end

  get "/foods/:id" do 
    @food = Food.find(params[:id])
    erb :show
    # binding.pry
  end

  # Request Methods
  # GET, POST, PATCH, DELETE, PUT

  # Database Actions
  # CREATE - POST
  # READ - GET
  # UPDATE - PATCH/PUT
  # DELETE - DELETE 
end
