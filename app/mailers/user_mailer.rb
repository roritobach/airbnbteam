class UserMailer < ApplicationMailer


    def welcome(user)
    @user = user  # Instance variable => available in view

    mail(to: @user.email, subject: 'Welcome to LeWagon')
    # This will render a view in `app/views/user_mailer`!
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #

end
