class TeamController < ApplicationController
  before_action :authenticate_user!

  def index
    @team = Team.all.order("display_order desc")
  end
  def show
    @team = Team.find(params[:id])
  end
   def new
      @team = Team.new
   end
  def create   
    @team = Team.create(testi_params)
    if @team.save  
      flash[:notice] = 'Team added!'   
      redirect_to team_index_path  
    else   
      flash[:error] = 'Failed to edit Team!'   
      render :new   
    end   
  end 
  def edit
  @team = Team.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @team = Team.find(params[:id])
    if @team.update_attributes(testi_params)   
      flash[:notice] = 'Team updated!'   
      redirect_to team_index_path   
    else   
      flash[:error] = 'Failed to edit Team!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = Team.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'Team updated!'
     redirect_to team_index_path  
  end 
  def destroy   
    @team = Team.find(params[:id])   
    if @team.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to team_index_path   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def testi_params   
    params.require(:team).permit(:image, :name, :designation, :description, :display_order, :status)   
  end 
end  