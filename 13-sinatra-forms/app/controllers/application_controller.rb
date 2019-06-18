require './config/environment'

class ApplicationController < Sinatra::Base

  # Configuration logic
  configure do
    set :public_folder, 'public' # Apply anything in the public folder
    set :views, 'app/views' # Make sure all of our views are in the app/views folder

    set :method_override, :true
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

  # The form will be displayed here
  get "/foods/new" do
    erb :new
  end

  post "/foods" do
    food = Food.create(name: params[:name], price: params[:price])

    # What URL path to go to
    redirect to("/foods/#{food.id}")
    # food = Food.create(params)
    # Comes back in Rails called "Strong Params"
    # binding.pry
  end

  get "/foods/:id/edit" do
    @food = Food.find(params[:id])
    erb :edit
  end

  patch "/foods/:id" do
    food = Food.find(params[:id])
    food.update(name: params[:name], price: params[:price])
    redirect to("/foods/#{food.id}")
  end


  # Routes
  get "/foods" do
    # All the foods in my database
    @foods = Food.all
    erb :index # "index.erb"
  end


  # Custom Route
  # get "/menu" do 
  #   @foods = Food.all
  #   erb :index # "index.erb"
  # end

  get "/foods/:id" do 
    @food = Food.find(params[:id])
    erb :show
    # binding.pry
  end

  delete "/foods/:id" do
    food = Food.find(params[:id])
    food.delete
    # Food.destroy(params[:id])
    redirect to("/foods")
  end

  # Request Methods
  # GET, POST, PATCH, DELETE, PUT

  # Database Actions
  # CREATE - POST
  # READ - GET
  # UPDATE - PATCH/PUT
  # DELETE - DELETE 
end
