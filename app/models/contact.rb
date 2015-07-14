#Requires name and email to be present in order for form submission to work
class Contact < ActiveRecord::Base
  validates :name, :email, presence: true
end