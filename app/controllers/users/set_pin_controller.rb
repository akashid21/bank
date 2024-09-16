class Users::SetPinController < Users::UsersController

  def edit
  end

  def update
    if current_user.update(pin_params)
      flash[:notice] = 'Updated successfully'
    else
      flash[:alert] = current_user.errors.full_messages
    end
    redirect_to edit_users_set_pin_path
  end
  private
  def pin_params
    params.require(:user).permit(:pin_number)
  end
end