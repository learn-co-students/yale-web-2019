class RollercoastersController < ApplicationController

  def new
    @rollercoaster = Rollercoaster.new
    @parks = Park.all
    render :new # /views/rollercoasters/new.html.erb
  end

  def create
    @rollercoaster = Rollercoaster.create(rollercoaster_params)
    # byebug
    if @rollercoaster.valid?
      redirect_to rollercoasters_path
    else
      flash[:error] = @rollercoaster.errors.full_messages
      @parks = Park.all
      render :new
    end
    # redirect_to "/rollercoasters"
  end

  def index
    @rollercoasters = Rollercoaster.all
    render :index
  end

  def edit
    @rollercoaster = Rollercoaster.find(params[:id])
    render :edit
  end

  def update
    rollercoaster = Rollercoaster.find(params[:id])
    rollercoaster.update(rollercoaster_params)

    redirect_to "/rollercoasters"
  end

  private 
  # STRONG PARAMS
  # MUST HAVE THIS METHOD
  def rollercoaster_params
    params.require(:rollercoaster).permit(:name, :location, :height, :length, :park_id)
  end
end