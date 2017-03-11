class AddDescriptionToCourse < ActiveRecord::Migration
  def change
    add_column :courses ,:description , :text
    add_column :courses ,:commitment , :string
  end
end
