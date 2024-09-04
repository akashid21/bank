class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  
  def create_image
  end

  def execute_transfer
    # debugger 
    @to_account = params[:to_account_number].to_i
    @ammount = params[:ammount].to_i
    all_account_number = User.pluck(:account_number)
    unless all_account_number.include? @to_account
      # debugger
      return redirect_to users_transfer_path, alert: 'Invalid account number'
    end
    # debugger
    unless current_user.balance >= @ammount.to_i
      return redirect_to users_transfer_path, alert: 'Low balance'
    end
    
    @to_user = User.find_by(account_number: @to_account)
    # debugger
    credited_ammount = @to_user.balance.to_i + @ammount
    @to_user.update(balance: credited_ammount)
    debited_ammount = current_user.balance.to_i - @ammount
    current_user.update(balance: debited_ammount)
    redirect_to users_root_path, notice: 'Sent successfully'
    # debugger
  end
end