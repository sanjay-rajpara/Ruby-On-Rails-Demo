class SignupController < ApplicationController

  def new
      @user = User.new
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
  def user_params   
    params.require(:user).permit(:name, :email, :role, :status, :password, :password_confirmation, :status_filter, :image)   
  end
end