class UserMailer < ApplicationMailer

    def salar_email(user, pass)
        @user = user 
        @pass = pass 
        mail(to: @user.email, subject: "Welcom to my beautiful site")
    end
end
