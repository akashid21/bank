class Users::AvatarController < Users::UsersController
  def edit 
  end

  def update
    current_user.image.attach(params[:image])
    redirect_to users_upload_avatar_path, success: 'Uoploaded successfullyt'
  end

  def destroy
  end
end