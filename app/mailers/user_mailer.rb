class UserMailer < ApplicationMailer
  def welcome_email(user)
    mail(to: user.email, subject: 'first mail')
  end
end
