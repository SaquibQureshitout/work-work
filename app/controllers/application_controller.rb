class ApplicationController < ActionController::Base
	before_action :configure_permitted_parameters, :if => :devise_controller?
	 helper_method :current_employee



	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :password, :company, :designation, :phone_num, :avatar])
	end 

	# def current_employee
	# 	@current_employee = Employee.find(params[:id])

		#@current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
		# @_current_employee ||= session[:current_employee_id] &&
    #    Employee.find(session[:current_employee_id])
		# params[:id]
		# @current_employee = Employee.find(params[:id])


		 #@current_employee ||= Employee.find_by(id: session[:employee_id])
		 # @current_employee=params.permit(:sign_up, keys: [:name, :email, :password, :company, :designation, :phone_num, :avatar])
		
		 # 
		 #  @current_employee ||= Employee.find(session[:employee_id]) if session[:employee_id]
	#end 

	#@employee.avatar.attach(params[:avatar])
end 

	
	# helper_method :current_user

	#def current_user
  #  if session[:employee_id]
   #   @current_user ||= Employee.find(session[:employee_id])
    #else
    #  #@current_user = nil
   # end
 # end

