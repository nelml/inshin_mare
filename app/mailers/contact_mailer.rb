class ContactMailer < ApplicationMailer
	def send_mail(user)
		@user = user
		mail to: user.email, from: 'konpaku.youmi@gmail.com', subject: '【インシンマーレ】お問い合わせありがとうございます。'
	end
end
