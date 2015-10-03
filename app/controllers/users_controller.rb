class UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy]
  
  def index
    @users = User.order(:username).paginate(page: params[:page])
    respond_to do |format|
      format.html
    end
  end

  def show
  end

  def import
    User.import(params[:file])
    redirect_to users_url, notice: "Users imported."
  end
  
  private
  def set_user
    @user = User.find(params[:id])
  end
end
