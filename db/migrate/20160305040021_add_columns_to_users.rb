class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string, null: false, default: ""
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :admin, :boolean
  end
end
