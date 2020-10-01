class ContactUsController < ApplicationController
	before_action :authenticate_user!, only:[:new]
	before_action :authenticate_admin!, only:[:index, :show]
  def index
  	@contact_us = Contact_u.all
  end

  def show
  	@contact_u = Contact_u.find(params[:id])
  end

  def new
  	@contact_u = Contact_u.new
  end

  def create
  	contact_u = Contact_u.new(contact_us_params)
  	user = contact_u.user
  	if contact_u.save
  		ContactMailer.contact_mailer(user, contact_u).deliver
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
