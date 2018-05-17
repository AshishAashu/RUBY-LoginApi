class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token  
    def lists
        @users = User.all
    end
    def login
        res = Hash.new
        user = User.where(name: params[:email],address: params[:password] ).take
        if user!=nil
            res[:status] = "OK"
            userinfo =Hash.new
            userinfo[:email] = user.name
            userinfo[:apikey] = user.apikey
            res[:userinfo] = userinfo
        else
            res[:status] = "fail"
            res[:msg] = "User Not Found."
        end    
        render json: res;
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
