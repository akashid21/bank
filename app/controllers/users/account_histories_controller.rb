class Users::AccountHistoriesController < Users::UsersController
  def index
    @history = current_user.account_histories.all.order(created_at: :desc)
    # debugger
  end
end