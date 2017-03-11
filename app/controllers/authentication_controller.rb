class AuthenticationController < ApplicationController

  def login_get
  end

  def login
    name=params[:username]
    password=params[:password]
    user=nil
    if params[:type]=='student'
      user=Student.find_by_name(name)
    else
      user=Teacher.find_by_name(name)
    end

    unless user
     return  redirect_to '/signup'
    end

    if user.password==password
      session[:user_id]=user.id
      session[:type]=params[:type]
      if params[:type]=='student'
        return redirect_to '/student_index'
      else
        return redirect_to '/teacher_index'
      end
    end
  end

  def signup_get
  end

  def signup
    user=nil
    if params[:type]=='student'
    user=Student.find_by_name(params[:username])
    else
    user=Teacher.find_by_name(params[:username])
    end

    unless user

      name=params[:username]
      password=params[:password]
      reconfirm_password=params[:reconfirm_password]

      if password==reconfirm_password
        session[:type]=params[:type]
        if params[:type]=='student'
        student=Student.create(:name=>name , :password=>password)
        session[:user_id]=student.id
        return redirect_to '/student_index'
        else
          teacher=Teacher.create(:name=>name , :password=>password)
          session[:user_id]=teacher.id
          return redirect_to '/teacher_index'
        end
      else
        return redirect_to '/signup'
      end

    end
    return redirect_to '/'
  end

  def logout
    session[:user_id]=nil
    session[:type]=nil
    return redirect_to '/'
  end
end
