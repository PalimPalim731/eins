class CreateUsers < ActiveRecord::Migration
  def change
    #drop_table :users
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :hashed_password
      t.integer :role

      t.timestamps null: false
    end
  end
end
