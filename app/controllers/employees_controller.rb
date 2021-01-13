class EmployeesController < ApplicationController
  before_action :authenticate_employee!, :change_image

  load_resource
  authorize_resource

  def new
  end 

  def index
    @employees = @employees.paginate(page: params[:page], per_page: 4)
  end
	
  def create 
   @employee = Employee.new(employee_params) #it will be there

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
      # @employee = Employee.find(params[:id])
     current_employee.update(avatar: params[:employee][:avatar])
     redirect_to profile_page_employees_path() 
   end

  # def current_employee_up
  #   current_employee.update(avatar: params[:employee][:avatar])
  #   redirect_to profile_page_employees_path() 
  # end 
  

  def edit
  end 

  def deactivate 
    #authorize! :deactivate, @employee
    if @employee.active?
      @employee.update(active: false)
    end

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.js   { render 'deactivate_activate' }
    end
  end

  def activate
    #authorize! :activate, @employee
    if !@employee.active?
      @employee.update(active: true)
    end 

    respond_to do |format|
      format.html { redirect_to employees_url }
      format.js   { render 'deactivate_activate' } 
    end
  end 

  	#redirect_to employees_path: 'Its updated to true'
  private 

  def employee_params
  	params.require(:employee).permit(:name , :email, :company, :designation, :phone_num, :password)
  end 

  def change_image
  	params.permit(:avatar)
  end 
end
