class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :edit, :update]
  before_action :options_for_select, only: [:edit]
  before_action :user_params, only: [:update]
  
  def index
    authorize! :manage, User
    @users = User.order(:username)
  end

  def show
    authorize! :manage, @user
  end
  
  def edit
    authorize! :manage, @user
  end
  
  def update
    authorize! :manage, @user
    if @user.update(user_params)
      redirect_to users_url
    else
      render action: 'edit'
    end
  end

  def destroy
    authorize! :manage, @user
  end
  
  def import
    User.import(params[:file])
    redirect_to users_url, notice: "Users imported."
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
  
  def user_params
    params.require(:user).permit(:id, :username, :role_id)
  end
  
  def options_for_select
    @roles = Role.order(:name)
  end
end
