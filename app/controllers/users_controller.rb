class UsersController < ApplicationController
  
  before_action :get_user, only: [:show, :edit, :update, :destroy]

  respond_to :html, :json

  def index
    respond_with User.all
  end

  def show
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new( user_params )

    if @user.save
      respond_with @user
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update( user_params )
      respond_with @user
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    respond_with @user
    redirect_to root_url
  end

  private
    def user_params
      params.require( :user ).permit( :username, :email, :password, :password_confirmation )
    end

    def get_user
      @user = User.find( params[:id] )
    end
end