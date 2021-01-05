class Employee < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :avatar    
  #attr_accessible :avatar   

  validates :name, presence: true 
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "Invalid"}, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }  
  validates :designation, presence: true
	validates :phone_num, presence: true, uniqueness: true, length: { is: 10 }
  validate  :companyname
  #validates :password_digest, presence: true, length: { minimum: 4, maximum: 14}

  def companyname
    if company != 'tout'
      errors.add(:company, 'Here only the employee of tout can fill this form' )
    end 
	end

  
#@employee.avatar.attach(params[:id])

 # def authenticate_password?(key)
   # key == password_digest
 # end 


# def avatar
#   if employee.avatar.attached?
#     employee.avatar.purge
#     employee.avatar.attach(params[:avatar])
#   else
#     employee.avatar.attach(params[:avatar])
#   end

  # def current_employee
  #   @current_employee = Employee.find(params[:id])
  #     current_employee = Employee.current_employee

  # end
end 


                       