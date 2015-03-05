class SessionsController < ApplicationController
  def new
  end

  def create
  	@username = params[:session][:username]
  	@password = params[:session][:password]
  	@user = User.find_by(username: @username) #This essentially says look inside the column username of the class User for the variable @username
  	if @user.present? and @user.authenticate(@password)
  		flash[:success] = "Logging in..."
  		# log them in
  		session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:error] = "Try again!"	
  		render :new
  	end
  end

  def show
  end

  def destroy
    reset_session
    flash[:success] = "Goodbye!"
    redirect_to root_path
  end
end
