class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params) #params: {name: 'asd', email: 'as@df', comments: "asdf'}"
    if @contact.save #save to database
      name = params[:contact][:name]
      email = params[:contact][:email]
      body = params[:contact][:comments]
      ContactMailer.contact_email(name, email, body).deliver #send email
      flash[:success] = "Message sent."
       redirect_to new_contact_path
    else
      flash[:danger] = @contact.errors.full_messages.join(", ")
       redirect_to new_contact_path
    end
  end
  
  private
    def contact_params #security feature
       params.require(:contact).permit(:name, :email, :comments)
    end
end