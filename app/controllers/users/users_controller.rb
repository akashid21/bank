class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_ammount, only: %i[execute_transfer deposite_money]
  before_action :set_to_account_number, only: %i[execute_transfer]
  
  def create_image
  end

  def execute_transfer
    if current_user.balance < @ammount
      return redirect_to users_transfer_path, alert: 'Low balance'
    end
    @sender_initial_balance = current_balance(current_user)
    @reciever_initial_balance = current_balance(@to_user)
    credited_ammount = @reciever_initial_balance + @ammount
    debited_ammount = @sender_initial_balance - @ammount

    if @to_user.update(balance: credited_ammount) && current_user.update(balance: debited_ammount)
      # update the sneder history
      sender_account_history = current_user.account_histories.new
      sender_account_history.initial_balance = @sender_initial_balance
      sender_account_history.transaction_history = "Rs.#{@ammount} send to #{@to_user.name}"
      sender_account_history.final_balance = current_balance(current_user)
      sender_account_history.save

      # update the reciever history
      reciever_account_history = @to_user.account_histories.new
      reciever_account_history.initial_balance = @reciever_initial_balance
      reciever_account_history.transaction_history = "Rs.#{@ammount} recieved from #{current_user.name}"
      reciever_account_history.final_balance = current_balance(@to_user)
      reciever_account_history.save

      redirect_to users_root_path, notice: 'Sent successfully'
    end
  end

  # get method for deposte
  def deposite
  end

  # post method for deposite 
  def deposite_money
    # debugger  
    @initial_balance = current_balance(current_user)
    @final_ammount = @initial_balance + @ammount
    if current_user.update(balance: @final_ammount)
      # update current user account history
      history = current_user.account_histories.new
      history.initial_balance = @initial_balance
      statement = "Rs.#{@ammount} deposited to #{current_user.name}"
      history.final_balance = @final_ammount.to_i
      history.transaction_history = statement.to_s
      history.save
      UserMailer.with(
        deposite_ammount: @ammount,
        user: current_user
      ).money_deposite.deliver_now
    end
    redirect_to users_root_path, notice: 'Deposited successfully!!'
  end

  private 

  def set_ammount
    @ammount = params[:ammount].to_i
    flash[:alert] = 'invalid ammount' if @ammount <= 0
    if flash[:alert].present?
      if request.referer.include? '/users/deposite'
        redirect_to users_deposite_path
      elsif request.referer.include? '/users/transfer'
        redirect_to users_transfer_path
      end
    end
  end

  def set_to_account_number
    all_account_number = User.pluck(:account_number)
    unless all_account_number.include? params[:to_account_number].to_i
      return redirect_to users_transfer_path, alert: 'Invalid account number'
    end
    @to_user = User.find_by(account_number: params[:to_account_number])
  end

  def current_balance user_account
    return user_account.balance.to_i
  end
end