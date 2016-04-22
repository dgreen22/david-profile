class ContactsController < ApplicationController


def new
	@contact = Contact.new
end


def create
	@contact = Contact.new(contact_params)
    if @contact.save
      format.html { redirect_to '/home', notice: "Thank you for the message. I will be in touch soon!"}
    else
      flash.now[:error] = 'Cannot send message.'
      render :new
    end
end


private

  def contact_params
  	params.require(:contact).permit(:name, :email, :phone, :message)
  end

end
