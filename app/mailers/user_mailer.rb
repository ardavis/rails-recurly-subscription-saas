class UserMailer < ActionMailer::Base
  default from: "notifications@studyhall.com"

  def expire_email(user)
    mail(to: user.email, subject: 'Subscription Cancelled')
  end
end
