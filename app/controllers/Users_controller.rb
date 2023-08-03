class UsersController < ApplicationController
	before_action :set_user, only:[:edit, :update, :show, :destroy]
	before_action :require_user, only: [:edit, :update, :destroy]
	before_action :require_same_user, only: [:edit, :update, :destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:notice]= "welcome to alfa-blog"
			session[:user_id] = @user.id
			redirect_to @user
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end
	def update
		if @user.update(user_params)
			flash[:notice]= "user updated sucessfully"
			redirect_to @user
		else
			render 'edit'
		end
	end
	def destroy
		@user.destroy
		session[:user_id] = nil
		flash[:notice]= "user deleted sucessfully"
		redirect_to users_path
	end

	private

	def set_user
		@user = User.find(params[:id])

	end
	def user_params
		params.require(:user).permit(:user_name, :email, :password)
	end

	def require_same_user
      if @user != current_user && !current_user.admin?
        flash[:notice]= "you can perform this action on your own profile"
        redirect_to @user
      end
    end
	
end