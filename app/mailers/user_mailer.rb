class UserMailer < ApplicationMailer

  def money_deposite
    @deposite_ammount =  params[:deposite_ammount]
    @user = params[:user]

    mail(
      to: @user.email,
      subject: 'Money deposited'
    )
  end
end
