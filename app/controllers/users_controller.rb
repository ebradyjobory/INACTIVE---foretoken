class UsersController < ApplicationController

  before_action :set_user, only: [:show, :edit, :update, :destroy]


  def index
  	@users = User.all
  end

  def show
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:notice] = "User was created successfully"
  		redirect_to(:action => 'index')
  	else
  		render('new')
  	end
  end

  def edit
  end

  def update
  	if @user.update_attributes(user_params)
  		flash[:notice] = "User information was updated successfully"
  		redirect_to(:action => 'index')
  	else
  		render('edit')
  	end
  end

  def destroy
  	if @user.destroy
  		redirect_to(:action => 'index')
  	end
  end



  private

    def set_user
      @user = User.find(params[:id])
    end

  	def user_params
  		params.require(:user).permit(:first_name, :last_name, :email, :username, :password)	
  	end


end
