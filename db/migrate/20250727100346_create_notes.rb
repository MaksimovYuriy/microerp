class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.references :client, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.datetime :date
      t.string :state

      t.timestamps
    end
  end
end
