class UsersController < Clearance::UsersController
  before_action :authorize, only: [:show, :edit, :update, :index]

  def new
    @user = User.new
    respond_with @user
  end

  def show
    @user = current_user.visible_users.find(params[:id])
    respond_with @user
  end

  def edit
    @user = current_user.editable_users.find(params[:id])
  end

  def update
    @user = current_user.editable_users.find(params[:id])
    @user.update(user_params)
    respond_with @user
  end

  def index
    @users = current_user.visible_users
    respond_with @users
  end

  private

  def user_from_params
    Clearance.configuration.user_model.new(user_params)
  end

  def user_params
    if current_user && current_user.admin?
      params.fetch(:user).permit(:email, :name, :password, :role)
    else
      params.fetch(:user).permit(:email, :name, :password)
    end
  end
end
