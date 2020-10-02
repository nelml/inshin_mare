class ContactsController < ApplicationController
	before_action :authenticate_user!, only:[:new]
	before_action :authenticate_admin!, only:[:index, :show]
  def index
  	@contact = Contact.all
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def new
  	@contact = Contact.new
  end

  def create
  	contact = Contact.new(contact_params)
    contact.user_id = current_user.id
    user = contact.user
  	if contact.save
  		ContactMailer.send_mail(user, contact).deliver
  		redirect_to root_path
  	else
  		render action: :new
  	end
  end

  def destroy
  end

  private
  def contact_params
  	params.require(:contact).permit(:title, :explain, :user_id)
  end
end
