class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all

  end
  def create   
    @user = User.new(user_params)   
    if @user.save  
      flash[:notice] = 'User added!'   
      redirect_to users_path   
    else   
      flash[:error] = 'Failed to edit User!'   
      render :new   
    end   
  end  
  def show
    @user = User.find(params[:id])
  end
  def edit
  @user = User.find(params[:id])
 end 
   
  # PUT method for updating in database a product based on id   
  def update   
    @user = User.find(params[:id])   
    if @user.update_attributes(user_params)   
      flash[:notice] = 'User updated!'   
      redirect_to users_path   
    else   
      flash[:error] = 'Failed to edit User!'   
      render :edit   
    end   
  end 
  def change 
     @obj_ids  = User.find(params[:id])
     @obj_ids.each do |p|
     p.update_attributes(:status => params[:status]) 
        end
        flash[:notice] = 'User updated!'
     redirect_to users_path 
  end 
  def user_params   
    params.require(:user).permit(:name, :email, :role, :status, :password, :password_confirmation, :status_filter, :image)   
  end 
  
  def destroy   
    @user = User.find(params[:id])   
    if @user.delete   
      flash[:notice] = 'User deleted!'   
      redirect_to users_path   
    else   
      flash[:error] = 'Failed to delete this User!'   
      render :destroy   
    end   
  end
  def destroyy
  session.clear
   redirect_to user_session_path, :notice => "Logged out"
  end
  def account_update_params
  devise_parameter_sanitizer.sanitize(:account_update)
end   
end
