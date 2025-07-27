class CreateWorkers < ActiveRecord::Migration[7.1]
  def change
    create_table :workers do |t|
      t.string :username
      t.string :encrypted_password
      t.string :password_salt
      t.integer :role
      t.integer :status

      t.timestamps
    end
  end
end
