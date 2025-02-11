class UsersController < ApplicationController
  def update
    @user = User.find(params[:id])

    if params[:user][:file].present?
      @user.attachments.create(file: params[:user][:file], category: "profile_picture")
    end

    if @user.update(user_params)
      redirect_to @user, notice: "Profile updated successfully."
    else
      render :edit
    end
  end

  


  private

  def user_params
    params.require(:user).permit(:name, :email, :gender) # No need for :file here
  end
end
