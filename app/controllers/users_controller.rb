class UsersController < ApplicationController

  before_action :logged_in_user , only: [:edit, :update]
  before_action :correct_user ,only: [:edit, :update]

	def index
        @maximo = 6
	end

  def show
    @user = User.find(params[:id])
    @received_requests = Request.where(recipient_id: params[:id])
    @sent_requests = Request.where(sender_id: params[:id])
    @adopted_animals = Animal.where(adoptant_id: params[:id])
    @rescued_animals = Animal.where(rescuer_id: params[:id])
    @bookmarked_animals = @user.bookmarked_animals
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
    	flash[:success] = "Welcome to Adopt Life!"
      redirect_to @user
    else
      render 'new'
    end
  end

   def edit
    @user = User.find(params[:id])
  end

   def update
    user = User.find(params[:id])
    case params[:commit]
    when 'Remove Bookmark'
      user.bookmarked_animals.delete(Animal.find(params[:animal_to_remove]))
    when 'Bookmark'
      user.bookmarked_animals << Animal.find(params[:animal_to_bookmark])
    end
    redirect_to @user
  end

    def new_user
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

	def user_params
		params.require(:user).permit(:fname,:lname, :email, :password,
                                   :password_confirmation, :addrline1, :addrline2)
	end



  def correct_user
      @user = User.find(params[:id])
      redirect_to(current_user) unless @user == current_user
  end


end
