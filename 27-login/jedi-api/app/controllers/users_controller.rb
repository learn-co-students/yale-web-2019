class UsersController < ApplicationController


  # POST /login
  # This is from when the person uses submit on the login
  # form
  def login
    user = User.find_by(email: params[:email])
    if user
      render json: user
    else
      render json: { error: "YOU CAN'T LOG IN"}, status: 401
    end
  end

  def show
    # GET /users/:id
    user = User.find(params[:id])
    render json: user
  end

end