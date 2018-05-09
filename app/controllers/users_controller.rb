class UsersController < ApplicationController
    def lists
        @users = User.all
    end
    def login
    end
    def register
    end
    def login_submit
    end
    def index
        redirect_to action: "login"
    end
    def create
        @user  = User.new(user_params)
        if @user.save
            puts "Created"
        else
            puts "fails"
        end
    end
    def user_params
        params.require(:users).permit(:name, :address)
    end
end
