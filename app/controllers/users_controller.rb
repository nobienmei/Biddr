class UsersController < ApplicationController

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Thank you for registering"
    else
      render :new
    end
  end

  def new
    @user = User.new
    @user.build_profile    # because it has_one
    # @user.questions.build (if has_many)
  end

	# def create
	#   @user = User.new(user_params)
	#   if @user.save
	#     redirect_to root_path, notice: "Thank you for registering"
	#   else
	#     render :new
	#   end
	# end

	private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, 
                                  {profile_attributes: [:first_name, :last_name, :address, :id]})
  end

end
