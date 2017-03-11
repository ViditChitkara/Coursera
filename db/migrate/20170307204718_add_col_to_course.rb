class AddColToCourse < ActiveRecord::Migration
  def change
    add_column :courses,:genre,:string

  end
end
