class EmployeesController < ApplicationController
	before_action :show_detail,  only: [:show, :deactivate, :activate ]
	#before_action :track_session, :reset_session
	before_action :authenticate_employee!, :change_image

	def new
		@employee = Employee.new
	end 

	def index
		#@employees = Employee.all
		@employees = Employee.paginate(:page => params[:page], :per_page => 4)
		#@employee = Employee.find(params[:id])
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

  def profile_page
  	#@ = Employee.find(params[:id])
  	#params.permit(:name, :email, :password, :company, :designation, :phone_num, :avatar)

  	#@employee = current_employee
  	#@employee.avatar.purge
  #	@employee.avatar.attach(params[:avatar])
  	#@employee = Employee.find(params[:id])
  	#@employee.update(avatar: params[:employee][:avatar])
  end

   def update
  #   #@employee = Employee.find(params[:id])
   	current_employee.update(avatar: params[:employee][:avatar])
   	redirect_to profile_page_employees_path() 
   end 
   
   def edit
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
		params.require(:employee).permit(:name , :email, :company, :designation, :phone_num, :password)
	end 

	def show_detail
		@employee = Employee.find(params[:id])
	end 

	def change_image
		params.permit(:avatar)
	end 

	#def track_session
#		if session[:employee_id].present?
	#	else
	#		redirect_to root_path, alert: "Unauthorized access!"
	#	end
	#end 

end 

