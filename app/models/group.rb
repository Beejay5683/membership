class Group < ActiveRecord::Base
  belongs_to :user
  has_many :members, dependent: :destroy
  has_many :users_added, through: :members, source: :user

  validates :title,  
  	presence: true, 
  	length: { minimum: 5 }

  	validates :description,  
  	presence: true, 
  	length: { minimum: 10 }

end
