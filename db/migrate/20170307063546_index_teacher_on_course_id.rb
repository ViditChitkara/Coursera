class IndexTeacherOnCourseId < ActiveRecord::Migration
  def change
    add_index :courses , :teacher_id , unique: true
  end
end
