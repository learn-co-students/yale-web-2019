require './config/environment'

class ApplicationController < Sinatra::Base

  # Configuration logic
  configure do
    set :public_folder, 'public' # Apply anything in the public folder
    set :views, 'app/views' # Make sure all of our views are in the app/views folder

    set :method_override, :true
  end

 
end
