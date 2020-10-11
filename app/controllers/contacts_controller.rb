class ContactsController < ApplicationController
	before_action :authenticate_user!, only:[:new]
	before_action :authenticate_admin!, only:[:index, :show, :destroy]
  def index
  	@contact = Contact.all
  end

  def show
  	@contact = Contact.find(params[:id])
  end

  def new
  	@contact = Contact.new
    @contacts = Contact.all
  end

  def create
  	contact = Contact.new(contact_params)
    contact.user_id = current_user.id
  	if contact.save
  		ContactMailer.send_mail(current_user).deliver_now
  		redirect_to root_path
  	else
  		render action: :new
  	end
  end

  def destroy
    contact = Contact.find(params[:id])
    contact.destroy
    redirect_to admins_top_path
  end

  private
  def contact_params
  	params.require(:contact).permit(:title, :explain, :user_id)
  end
end
