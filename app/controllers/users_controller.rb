class UsersController < ApplicationController
	before_action :search, only: [:show, :edit, :destroy]

	def index
		@users = User.all.order(created_at: :desc)
	end

	def show
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to root_path
		else
			redirect_to 'users#new'
		end
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to @post
		else
			render 'edit'
		end
	end

	def destroy
		@post.destroy
		redirect_to root_path
	end

	private

	def search
		@user =  User.find(params[:id])
	end

	def user_params
		params.required(:user).permit(:name, :description, :avatar)
	end


end
