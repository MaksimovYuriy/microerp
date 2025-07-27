class CreateClients < ActiveRecord::Migration[7.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :phone
      t.string :telegram, default: nil
      t.integer :bonuses, default: 0
      t.string :description, default: nil
      t.datetime :birth_date, default: nil

      t.timestamps
    end
  end
end
