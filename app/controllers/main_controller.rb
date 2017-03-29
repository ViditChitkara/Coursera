class MainController < ApplicationController
  before_action 'authenticate_user'

  def student_index
    @web=Course.where(:genre=>'web').order('created_at DESC')
    @android=Course.where(:genre=>'android')
    @java=Course.where(:genre=>'java')
    @ruby=Course.where(:genre=>'ruby')
    @others=Course.where(:genre=>'others')
    @my_courses=current_user.courses
  end

  def teacher_index
    @web=Course.where(:genre=>'web').order('created_at DESC')
    @android=Course.where(:genre=>'android')
    @java=Course.where(:genre=>'java')
    @ruby=Course.where(:genre=>'ruby')
    @others=Course.where(:genre=>'others')
    @my_courses=current_user.courses
  end

  def add_course
  end

  def add_course_post
    title=params[:title]
    #content=params[:content]
    genre=params[:type]
    commitment=params[:commitment]
    description=params[:description]

    Course.create(:name=>title , :genre=>genre , :teacher_id=>session[:user_id],:commitment=>commitment,:description=>description)

    redirect_to '/teacher_index'

  end

  def update_course

    @course=Course.find_by_id(params[:course])
    @lectures=@course.lectures.all

  end

  def update_course_post
      id=params[:course_id].to_i
      course=Course.find(id)   

      course.update(name: params[:title] , :genre=>params[:genre] , description: params[:description] , commitment: params[:commitment])
      render json:course
  end

  def display_courses
    @genre=params[:genre]
    @courses=Course.includes(:teacher).where(:genre=>params[:genre])
  end

  def teacher_display_courses
    @genre=params[:genre]
    @courses=Course.includes(:teacher).where(:genre=>params[:genre])
  end

  def enroll
    Certificate.create(:student_id=>current_user.id,:course_id=>params[:course_id],:completed=>false)
    redirect_to '/student_index'
  end

  def study_course
    @course=nil
    if session[:course]
      @course=Course.find_by_id(session[:course])
      session[:course]=nil
    else
    @course=Course.find_by_id(params[:course])
    end

     @lectures=@course.lectures.all

    @certificate=Certificate.find_by_course_id_and_student_id(@course.id,current_user.id)
  end

  def toggle_completed
    certificate=Certificate.find_by_id(params[:certificate])
    course=Course.find_by_id(params[:course])
    unless certificate.completed
      Certificate.create(:student_id=>current_user.id,:course_id=>course.id,:completed=>true)
    else
      Certificate.create(:student_id=>current_user.id,:course_id=>course.id,:completed=>false)
    end
    certificate.destroy
    redirect_to '/student_index'
  end


  def study_lecture
    @course=Course.find_by_id(params[:course])
    @lectures=@course.lectures.all
    @current_lecture=Lecture.find_by_id(params[:lecture])
    @youtube_link=youtube_embed(@current_lecture.link)
  end

  def create_lecture
    @course=Course.find_by_id(params[:course])
  end

  def create_lecture_post

    title=params[:lecture_title]
    content=params[:lecture_content]
    course_id=params[:course_id]
    link=params[:link]
    Lecture.create(:title=>title , :content=>content , :course_id=>course_id , :visited=>false , :link=>link)
    redirect_to '/teacher_index'
  end


  def update_lecture
    @course=Course.find_by_id(params[:course])
    @lectures=@course.lectures.all
    @lecture=Lecture.find_by_id(params[:lecture])

  end

  def update_lecture_post
      id=params[:lec_id].to_i
      lecture=Lecture.find(id)   

      lecture.update(title: params[:lectureTitle] , content: params[:lectureContent] , link: params[:link])
      render json:lecture
  end

  def youtube_embed(youtube_url)
    if youtube_url
      if youtube_url[/youtu\.be\/([^\?]*)/]
        youtube_id = $1
      else
        # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
        youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
        youtube_id = $5
      end
    end
    youtube_id

  end

end
