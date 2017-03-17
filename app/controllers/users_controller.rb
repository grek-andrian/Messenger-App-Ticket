class UsersController < ApplicationController
    before_action :signed_in_user
    before_action :authenticate_user!, :redirect_unless_admin,  only: [:new, :create]
    before_action :admin_user, only: :destroy

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def show
        @user = User.find(params[:id])
    end

    def destroy
        User.find(params[:id]).destroy
        flash[:success] = 'User deleted.'
        redirect_to users_admin_index_url
    end

    private

    def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation, :avatar)
    end

    def signed_in_user
        unless signed_in?
            flash[:error] = 'Please sign in.'
            redirect_to user_session_path
        end
    end

    def admin_user
        redirect_to(root_url) unless current_user.admin?
    end

    def redirect_unless_admin
    unless current_user.try(:admin?)
      flash[:error] = "Only admins can do that"
      redirect_to root_path
    end
  end
end
