class UserMailer < ActionMailer::Base
  default from: "rottenMANGOESSSSSS@master.com"


  def welcome_email(user)
    @user = user
    @url = 'http://localhost:3000/movies'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site', delivery_method: :test)
  end
end
