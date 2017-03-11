class AddColToCertificates < ActiveRecord::Migration
  def change
    add_column :certificates,:completed,:boolean
  end
end
