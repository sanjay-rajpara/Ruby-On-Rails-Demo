class SliderController < ApplicationController
  before_action :authenticate_user!

  def index
    @slider = Slider.all.order("display_order desc")
  end
  def show
    @slider = Slider.find(params[:id])
  end
   def new
      @slider = Slider.new
   end
  def create   
    @slider = Slider.create(testi_params)
    if @slider.save  
      flash[:notice] = 'Slider added!'   
      redirect_to slider_index_path  
    else   
      flash[:error] = 'Failed to edit Slider!'   
      render :new   
    end   
  end 
  def edit
  @slider = Slider.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @slider = Slider.find(params[:id])
    if @slider.update_attributes(testi_params)   
      flash[:notice] = 'Slider updated!'   
      redirect_to slider_index_path   
    else   
      flash[:error] = 'Failed to edit Slider!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = Slider.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'Slider updated!'
     redirect_to slider_index_path  
  end 
  def destroy   
    @slider = Slider.find(params[:id])   
    if @slider.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to slider_index_path   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def testi_params   
    params.require(:slider).permit(:image, :title, :url, :display_order, :status)   
  end 
end  