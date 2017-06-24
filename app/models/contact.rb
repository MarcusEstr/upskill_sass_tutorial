class Contact < ActiveRecord::Base
   #validation of contact form
  validates :name, presence: true
  validates :email, presence: true
  validates :comments, presence: true
end