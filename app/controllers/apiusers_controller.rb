
class ApiusersController < ApplicationController
    skip_before_action :verify_authenticity_token


    #####################################################################
    #                                                                   #
    #        Function To list of user who uses api.                     #
    #                                                                   #
    #####################################################################

    def apiuserlist
        apikey = request.headers["apikey"]
        res = Hash.new
        if apikey!=nil
            user = User.where(apikey: apikey)
            if !user.empty?
                res[:status] = "OK"
                @apiusers = Apiuser.where(apikey: apikey)
                res[:users] = @apiusers
                # res[:total] = @apiusers.count
                # res[:users]= Array.new
                # @apiusers.each do |apiuser|
                #     user = Hash.new
                #     user = apiuser
                #     res[:users].push(user) 
                # end
            else
                res[:status] = "Fail"
                res[:message] = "No such api exists"
            end
        else
            res[:status] = "Fail"
            res[:message] = "Apikey missing or not matches."
        end
        render json: res;
    end


    #####################################################################
    #                                                                   #
    #        Function To register a new user on request.                #
    #                                                                   #
    #####################################################################

    def apiregister
        apikey = request.headers["apikey"]
        res = Hash.new
        if apikey!=nil
            user = User.where(apikey: apikey)
            if !user.empty?
                apiusers = Apiuser.where(email: params[:email]).count
                if apiusers == 0
                    apiuser = Apiuser.new
                    apiuser.name = params[:name]
                    apiuser.email = params[:email]
                    apiuser.password = params[:password]
                    apiuser.course = Course.find(params[:course])
                    apiuser.apikey = apikey
                    apiuser.youtube_id = params[:youtube_id]
                    if apiuser.save
                        res[:status] = "OK"
                        res[:message] = "User Created."
                        res[:userinfo] = apiuser
                    else
                        res[:status] = "Fail"
                        res[:message] = "Something went wrong."
                    end
                else
                    res[:status] = "Fail"
                    res[:message] = "Email is already registered."
                end
            else
                res[:status] = "Fail"
                res[:message] = "User not exist with provided Apikey."
            end
        else
            res[:status] = "Fail"
            res[:message] = "Apikey is not provided."
        end
        render json: res;
    end


    #####################################################################
    #                                                                   #
    #        Function To login a new user on request.                   #
    #                                                                   #
    #####################################################################

    def apilogin
        res = Hash.new
        apikey = request.headers["apikey"]
        if apikey != nil
            apiuser = Apiuser.where(email: params[:email],password: params[:password],
                        apikey: apikey ).take
            if apiuser!=nil
                res[:status] = "OK"
                if apiuser.apiuserkey==nil
                    loggedinkey = getLoggedinKey
                    apiuser.apiuserkey = loggedinkey
                    apiuser.save
                end
                userinfo =Hash.new
                userinfo[:name] = apiuser.name
                userinfo[:email] = apiuser.email
                userinfo[:password] = apiuser.password
                userinfo[:course_name] = apiuser.course.course_name
                userinfo[:apiuserkey] = apiuser.apiuserkey
                userinfo[:youtube_id] = apiuser.youtube_id
                res[:userinfo] = userinfo
            else
                res[:status] = "fail"
                res[:msg] = "User Not Found."
            end    
        else
            res[:status] = "Fail"
            res[:message] = "Apikey Missing."
        end
        render json: res;
    end


    #####################################################################
    #                                                                   #
    #        Function To update info of user on request.                #
    #                                                                   #
    #####################################################################

    def apiupdate
        res = Hash.new
        apiuserkey = request.headers["apiuserkey"]
        if apiuserkey != nil
            apiuser = Apiuser.where(email: params[:email],apiuserkey: apiuserkey ).take
            if apiuser!=nil
                res[:status] = "OK"
                if params[:name]!=nil
                    apiuser.name = params[:name]
                end
                if params[:password]!=nil
                    apiuser.password = params[:password]
                end
                if apiuser.save
                    res[:message] = "Updated successfully."
                else
                    res[:message] = "Something went wrong."
                end
                userinfo =Hash.new
                userinfo[:name] = apiuser.name
                userinfo[:email] = apiuser.email
                userinfo[:password] = apiuser.password
                userinfo[:course_name] = apiuser.course.course_name
                userinfo[:youtube_id] = apiuser.youtube_id
                userinfo[:apiuserkey] = apiuser.apiuserkey
                res[:userinfo] = userinfo
            else
                res[:status] = "fail"
                res[:msg] = "User Not Found."
            end    
        else
            res[:status] = "Fail"
            res[:message] = "ApiUserKey Missing."
        end
        render json: res;
    end


    #####################################################################
    #                                                                   #
    #        Function To delete a  user on request.                  #
    #                                                                   #
    #####################################################################

    def apidelete
        puts "Register User"
    end


    #####################################################################
    #                                                                   #
    #        Function To logout a new user on request.                  #
    #                                                                   #
    #####################################################################

    def apilogout
        res = Hash.new
        apiuserkey = request.headers["apiuserkey"]
        if apiuserkey != nil
            apiuser = Apiuser.where(apiuserkey: apiuserkey ).take
            if apiuser!=nil
                apiuser.apiuserkey = nil
                if apiuser.save
                    res[:status] = "OK"
                    res[:message] = "Logout Successful."
                else
                    res[:status] = "Fail"
                    res[:message] = "Logout Fails."
                end
            else
                res[:status] = "fail"
                res[:message] = "No such user loggedin."
            end    
        else
            res[:status] = "Fail"
            res[:message] = "ApiUserKey Missing."
        end
        render json: res;
    end



    #####################################################################
    #                                                                   #
    #        Function To get "apiuserkey" on login of user.             #
    #                                                                   #
    #####################################################################
    
    def getLoggedinKey
        key = ""
        chars = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM0123456789"
        25.times do
            key << chars[rand(chars.size)]
        end
        key
    end

    #####################################################################
    #                                                                   #
    #        Function To addcourse on api call                          #
    #                                                                   #
    #####################################################################

    def addcourse
        res = Hash.new
        if params[:course_name] != nil
            @course = Course.new
            @course.course_name = params[:course_name].upcase
            @course.save
            res[:status] = "OK"
            res[:message] = "course created."    
        else
            res[:status] = "Fail"
            res[:message] = "Course namne not provided."
        end
        render json: res;
    end


    #####################################################################
    #                                                                   #
    #        Function To get "courses" on api call of user.              #
    #                                                                   #
    #####################################################################

    def getcourses
        coursearr = Array.new;
        res = Hash.new
        apikey = request.headers["apikey"]
        if apikey != nil
            user = User.where(apikey: apikey ).take
            if user!=nil
                @course = Course.all
                res[:status] ="OK"
                @course.each do |cs|
                    c = Hash.new
                    c[:course_id] = cs.id
                    c[:course_name] = cs.course_name
                    # c[:course_users] = Hash.new
                    # c[:course_users][:users] = cs.apiusers
                    # p cs.apiusers
                    coursearr.push(c)
                end
                res[:courses] = coursearr
            else
                res[:status] = "fail"
                res[:message] = "No such user find."
            end    
        else
            res[:status] = "Fail"
            res[:message] = "ApiKey Missing."
        end
        render json: res;
    end


    #####################################################################
    #                                                                   #
    #        Function To get "courses with belongs user"                #
    #        on api call of user.                                       #
    #                                                                   #
    #####################################################################

    def getcourseswithusers
        coursearr = Array.new;
        res = Hash.new
        apikey = request.headers["apikey"]
        if apikey != nil
            user = User.where(apikey: apikey ).take
            if user!=nil
                @course = Course.all
                res[:status] ="OK"
                res[:total] = @course.count
                @course.each do |cs|
                    c = Hash.new
                    c[:course_id] = cs.id
                    c[:course_name] = cs.course_name
                    c[:total] = 0
                    c[:course_users] = Hash.new
                    c[:course_users][:users] = cs.apiusers
                    c[:total] = cs.apiusers.count
                    # p cs.apiusers
                    coursearr.push(c)
                end
                res[:courses] = coursearr
            else
                res[:status] = "fail"
                res[:message] = "No such user find."
            end    
        else
            res[:status] = "Fail"
            res[:message] = "ApiKey Missing."
        end
        render json: res;
    end

    #####################################################################
    #                                                                   #
    #        Function To get "userdetail" on request.                   #
    #                                                                   #
    #####################################################################

    def getapiuserrestrictdata
        res = Hash.new
        apiuserkey = request.headers["apiuserkey"]
        if apiuserkey != nil
            apiuser = Apiuser.where(apiuserkey: apiuserkey ).take
            if apiuser!=nil
                res[:status] = "OK"
                userinfo =Hash.new
                userinfo[:name] = apiuser.name
                userinfo[:email] = apiuser.email
                userinfo[:password] = apiuser.password
                userinfo[:course_name] = apiuser.course.course_name
                userinfo[:youtube_id] = apiuser.youtube_id
                res[:userinfo] = userinfo
            else
                res[:status] = "fail"
                res[:msg] = "User Not Found."
            end    
        else
            res[:status] = "Fail"
            res[:message] = "ApiUserKey Missing."
        end
        render json: res;
    end
end
