class UsersController < ApplicationController
  
  # GET /users/new
  # GET /users/new.xml
  def new  
    @user = User.new  
  end  
  
  def create  
	@user = User.new(params[:user])  
	if @user.save  
		flash[:notice] = "Registration successful."  
		redirect_to root_url  
	else  
		render :action => 'new'  
	end  
  end  
  
 end