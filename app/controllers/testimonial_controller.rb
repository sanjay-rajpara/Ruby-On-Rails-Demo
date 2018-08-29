class TestimonialController < ApplicationController
  before_action :authenticate_user!

  def index
    @testimonial = Testimonial.all
             .order("display_order desc")
  end
  def show
    @testimonial = Testimonial.find(params[:id])
  end
  def create   
    @testimonials = Testimonial.new(testi_params)   
    if @testimonials.save   
      flash[:notice] = 'Testimonial added!'   
      redirect_to testimonial_index_path  
    else   
      flash[:error] = 'Failed to edit Testimonial!'   
      render :new   
    end   
  end 
  def edit
  @testimonial = Testimonial.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @testimonial = Testimonial.find(params[:id])   
    if @testimonial.update_attributes(testi_params)   
      flash[:notice] = 'Testimonial updated!'   
      redirect_to testimonial_index_path   
    else   
      flash[:error] = 'Failed to edit Testimonial!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = Testimonial.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'Testimonial updated!'
     redirect_to testimonial_index_path  
  end 
  def destroy   
    @testimonial = Testimonial.find(params[:id])   
    if @testimonial.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to testimonial_index_path   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def testi_params   
    params.require(:testimonial).permit(:title, :testimonial, :client_name, :display_order, :status)   
  end 
end  