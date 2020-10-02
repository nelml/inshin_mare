class ContactMailer < ApplicationMailer
	def send_mail(user, contact)
		@user = user
		@answer = contact.explain
		mail(
			to: user.email,
			subject: '【インシンマーレ】お問い合わせありがとうございます。'
			)
	end
end
