class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

    helper_method 'user_logged_in?','current_user','authenticate_user'
    def current_user
      if user_logged_in?
        student=nil
        teacher=nil
        if session[:type]=='student'
          student = Student.find(session[:user_id])
          else
            teacher = Teacher.find(session[:user_id])
        end

        if student
          return student
         else
            return teacher
        end

      end
    end

    def authenticate_user
      unless user_logged_in?
        return redirect_to '/login'
      end
    end


    def user_logged_in?
        return !session[:user_id].nil?
    end

  end
