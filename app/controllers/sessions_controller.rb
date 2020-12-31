class SessionsController < ApplicationController

  
  def new
  end

  def create
  	@employee = Employee.find_by_email(params[:email])
  	if @employee && @employee.authenticate_password?(params[:password])
  		 session[:employee_id] = @employee.id
  		 redirect_to employees_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy 
    session[:employee_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def getin
  	redirect_to root_url, notice: "Please login first to get the acccess"
  end 




end

#custom method in employeee