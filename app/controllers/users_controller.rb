class UsersController < ApplicationController

  #you have to be signed in  to run the actions except index and show
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]
  before_action :require_admin, only: [:index]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @registrations = @user.registrations
    @liked_events = @user.liked_events
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id]= @user.id
      redirect_to @user, notice: "Thanks for signing up!"
    else 
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update (user_params)
      redirect_to @user, notice: "Account successfully updated"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id]= nil
    redirect_to events_url, status: :see_other, alert: "Account successfully deleted!"
  end

  private
  def user_params
    params.require(:user).
      permit(:name, :email, :password, :password_confirmation)
  end
end
