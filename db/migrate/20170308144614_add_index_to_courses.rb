class AddIndexToCourses < ActiveRecord::Migration
  def change
    add_index :courses , :teacher_id
  end
end
