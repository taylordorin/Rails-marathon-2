class HousesController < ApplicationController

  def index
    @houses = House.all
  end

  def new
    @house = House.new
  end

  def create
    @house = House.new(house_params)

    if @house.save
      flash[:notice] = "House added successfully"
      redirect_to house_path(@house)
    else
      flash[:alert] = "House failed to add successfully"
      render :new
    end
  end

  def show
    @house = House.find(params[:id])
    @members = @house.members
    @member = Member.new
  end

  private

  def house_params
    params.require(:house).permit(:name, :source, :author, :motto)
  end
end
