class RemoveUniqueConstraint < ActiveRecord::Migration
  def change
    remove_index :courses, :teacher_id
  end
end
