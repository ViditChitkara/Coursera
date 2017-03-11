class AddIndexToGenre < ActiveRecord::Migration
  def change
    add_index :courses,:genre
  end
end
