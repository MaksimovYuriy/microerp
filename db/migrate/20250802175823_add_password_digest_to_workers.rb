class AddPasswordDigestToWorkers < ActiveRecord::Migration[7.1]
  def change
    add_column :workers, :password_digest, :string
    remove_column :workers, :encrypted_password, :string
    remove_column :workers, :password_salt, :string
  end
end
