class EmployeesController < ApplicationController
	before_action :show_detail,  only: [:show, :deactivate, :activate]
	before_action :track_session, :reset_session
	def new
		@employee = Employee.new
	end 

	def index
		@employees = Employee.all
	end
	
	def create 
		@employee = Employee.new(employee_params)
		if @employee.save
			 redirect_to employee_path(@employee) 
		else
     render :new
    end
	end

	def show
  end 


  def deactivate
  	if @employee.active?
  		 @employee.update(active: false)
  		 redirect_to employees_path, notice: 'its updated  to false'
     end
  end 


  def activate
  	if !@employee.active?
  		 @employee.update(active: true)
  		 redirect_to employees_path, notice: 'Its true now'
  	end 

  	#redirect_to employees_path: 'Its updated to true' 
  
  end 

	private 

	def employee_params
		params.require(:employee).permit(:name , :email, :company, :designation, :phone_num, :password_digest)
	end 

	def show_detail
		@employee = Employee.find(params[:id])
	end 

	def track_session
		if session[:employee_id].present?
		else
			redirect_to root_path, alert: "Unauthorized access!"
		end
	end 

	def reset_session
		if session[:employee_id] == nil
			
    end
  end 
end 

