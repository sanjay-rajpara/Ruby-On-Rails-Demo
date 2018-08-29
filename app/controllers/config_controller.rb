class ConfigController < ApplicationController
  before_action :authenticate_user!

  def index
    @config = Config.all
  end
  def show
    @config = Config.find(params[:id])
  end
   def new
      @config = Config.new
   end
  def create   
    @config = Config.create(testi_params)
    if @config.save  
      flash[:notice] = 'Config added!'   
      redirect_to config_index_path  
    else   
      flash[:error] = 'Failed to edit Config!'   
      render :new   
    end   
  end 
  def edit
  @config = Config.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @config = Config.find(params[:id])
    if @config.update_attributes(testi_params)   
      flash[:notice] = 'Config updated!'   
      redirect_to config_index_path   
    else   
      flash[:error] = 'Failed to edit Config!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = Config.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'Config updated!'
     redirect_to config_index_path  
  end 
  def destroy   
    @config = Config.find(params[:id])   
    if @config.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to config_index_path   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def testi_params   
    params.require(:config).permit(:website_name, :email, :phone, :website, :logo)   
  end 
end  