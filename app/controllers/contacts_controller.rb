class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save 
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
    
      #Calls the mailer file with class name "ContactMailer" - Look in that file and run contact.email function, then pass in parameters, and deliver using .deliver method
      ContactMailer.contact_email(name, email, body).deliver
      
      flash[:success] = 'Message sent'
      redirect_to new_contact_path
    else
      flash[:danger] = 'Error, missing valid name or email'
      redirect_to new_contact_path
  end
  end
  
  private
  def contact_params
    params.require(:contact).permit(:name, :email, :comments)
  end
  
end