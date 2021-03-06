class User < ActiveRecord::Base
  has_secure_password

  has_many :groups, dependent: :destroy

  email_regex = /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/

  before_save :setcase

  validates :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :email, 
  	uniqueness: { case_sensitive: false },
  	presence: true,
  	format: { with: email_regex }

  def setcase
  	self.first_name.capitalize
  	self.last_name.capitalize
  	self.email.downcase!
  end
  
end
