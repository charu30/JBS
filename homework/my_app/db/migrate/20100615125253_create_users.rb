class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :usersname
      t.string :email_address
      t.string :password
      t.timestamps
    end
  end
  
  def self.down
    drop_table :users
  end
end
