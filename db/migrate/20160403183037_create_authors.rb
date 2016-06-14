class CreateAuthors < ActiveRecord::Migration
  def change
    create_table :authors do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.datetime :last_login

      t.timestamps null: false
      t.index(:username, unique: true)
    end
  end
end
