class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      #t.string :password
      #t.string :confirmation_password
      t.string :name
      t.string :lastname
      t.string :email
      t.string :alt_email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token

      t.datetime :last_login_at
      t.string :last_login_ip

      t.timestamps
    end
  end
end
