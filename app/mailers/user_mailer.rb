class UserMailer < ActionMailer::Base
  default from: ENV['MAILER_FROM']

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: I18n.t('user.mailers.welcome_email.subject'))
  end

  def contact_email(data)
    @data=data
    mail(to:@data.email, subject: I18n.t('user.mailers.welcome_email.subject'))
  end
end
