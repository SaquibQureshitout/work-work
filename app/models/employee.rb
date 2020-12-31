class Employee < ApplicationRecord

  validates :name, presence: true 
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/, message: "Invalid"}, uniqueness: { case_sensitive: false }, length: { minimum: 4, maximum: 254 }  
  validates :designation, presence: true
	validates :phone_num, presence: true, uniqueness: true, length: { is: 10 }
  validate  :companyname
  validates :password_digest, presence: true, length: { minimum: 4, maximum: 14}

  def companyname
    if company != 'tout'
      errors.add(:company, 'Here only the employee of tout can fill this form' )
    end 
	end
  def authenticate_password?(key)
    key == password_digest
  end 
end


                       