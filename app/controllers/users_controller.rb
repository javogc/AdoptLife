class UsersController < ApplicationController

	def index
	end

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
    	flash[:success] = "Welcome to Adopt Life!"
      redirect_to @user
    else
      render 'new'
    end
  end

  private

	def user_params
		params.require(:user).permit(:fname,:lname, :email, :password,
                                   :password_confirmation, :addrline1, :addrline2)
	end

end