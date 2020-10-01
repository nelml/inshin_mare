class ContactMailer < ApplicationMailer
	def contact_us(user, contact)
		@user = user
		@answer = contact.explain
		mail to: user.email, subject: '【インシンマーレ】お問い合わせありがとうございます。'
	end
end
