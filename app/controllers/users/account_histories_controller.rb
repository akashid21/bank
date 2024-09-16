class Users::AccountHistoriesController < Users::UsersController
  def index
    # @history = current_user.account_histories.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
    @q = current_user.account_histories.ransack(params[:q])
    @history = @q.result.paginate(page: params[:page], per_page: 10)
  end
end