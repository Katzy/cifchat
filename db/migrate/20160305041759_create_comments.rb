class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.timestamps
      t.text :body
      t.references :user, index: true
    end
  end
end
