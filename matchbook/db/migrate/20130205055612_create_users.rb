class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :username
      t.string :email
      t.date :birthdate
      t.string :first_name
      t.string :last_name
      t.integer :zipcode
      t.string :city
      t.string :state
      t.string :color
      t.string :gender
      t.string :email          
      t.string :encrypted_password 
      t.string :salt

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
