class MembersController < ApplicationController

  def new
    @house = House.find(params[:house_id])
    @member = Member.new
  end

  def create
    @house = House.find(params[:house_id])
    @member = Member.new(member_params)
    @member.house = @house

    if @member.save
      flash[:notice] = 'Member added successfully'
      redirect_to house_path(@house)
    else
      flash[:alert] = "Member failed to add successfully"
      @members = @house.members
      render "members/new"
    end
  end


  private

  def member_params
    params.require(:member).permit(:first_name, :last_name)
  end
end
