class UsersController < ApplicationController
    def show 
        render :show
    end

    def new_admin
        @user = User.new
        render :admin_new
    end

    def create_admin
        @user = User.new(user_params)
        set_admin
        if @user.save
            redirect_to new_session_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to new_session_url
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end



    private

    def user_params
        params.require(:user).permit(:email, :password, :admin)
    end

    def set_admin
        @user.admin = true
    end
end