class Message < ActiveRecord::Base 
  
  validates :name, presence: true
  validates :year_birth, presence: true
  validates :phone, presence: true
  validates :email, presence: true
  validates :studywork, presence: true
  validates :content, presence: true
  
end
