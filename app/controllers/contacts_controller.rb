class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  def create
    @contact = Contact.new(contact_params) #params: {name: 'asd', email: 'as@df', comments: "asdf'}"
    if @contact.save #save to database
       redirect_to new_contact_path, notice: "Message sent."
    else
       redirect_to new_contact_path, notice: "Error occured."
    end
  end
  private
    def contact_params #security feature
       params.require(:contact).permit(:name, :email, :comments)
    end
end