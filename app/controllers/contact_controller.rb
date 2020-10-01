class ContactController < ApplicationController
	before_action :authenticate_user!, only:[:new]
	before_action :authenticate_admin!, only:[:index, :show]
  def index
  	@contact_us = Contact_us.all
  end

  def show
  	@contact_us = Contact_us.find(params[:id])
  end

  def new
  	@contact_us = Contact_us.new
  end

  def create
  	contact_us = Contact_us.new(contact_us_params)
  	user = contact_us.user
  	if contact_us.save
  		ContactMailer.contact_mailer(user, contact_us).deliver
  		redirect_to root_path
  	else
  		render action: :new
  	end
  end

  def destroy
  end

  private
  def contact_us_params
  	params.require(:contact_us).permit(:title, :explain, :user_id)
  end
end
