class AddVisitedToLecture < ActiveRecord::Migration
  def change
  	 add_column :lectures,:visited,:boolean

  	 add_column :lectures,:title,:string
  end
end