class UsersController < ApplicationController
    before_action :signed_in_user
    before_action :authenticate_user!, :redirect_unless_admin, only: [:index, :show, :new, :create, :edit, :update, :destroy]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            flash[:success] = 'You create new user!'
            redirect_to users_admin_index_path
        else
            flash[:error] = 'please complete all fields'
            render 'new'
        end
end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            flash[:success] = 'Profile updated'
            redirect_to users_admin_path
        else
            flash[:error] = 'Please complete all fields'
            render 'edit'
        end
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

    def redirect_unless_admin
        unless current_user.admin?
            flash[:error] = 'Only admins can do that'
            redirect_to root_path
        end
  end
end
