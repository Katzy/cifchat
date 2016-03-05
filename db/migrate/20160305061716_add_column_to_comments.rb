class AddColumnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :admin, :boolean
  end
end
