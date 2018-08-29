class SignupController < Devise::RegistrationsController
  protected

  def create  
    @user = User.new(user_paramss)  

    if @user.save   
    	#abort @user.inspect
      flash[:notice] = 'User added!'   
      redirect_to new_user_session_path   
    else   
      flash[:error] = 'Failed to edit User!'   
      render :new   
    end   
  end 
  def user_params   
    params.require(:user).permit(:name, :email, :role, :status, :password, :password_confirmation)   
  end
end