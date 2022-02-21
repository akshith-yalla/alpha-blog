class DropUsersTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :users do |t|
      t.string :username, null: false
      t.string :email, null: false
      t.string :password_digest, null: false
      t.boolean :admin, null: false
      t.timestamps null: false
    end
  end
end
