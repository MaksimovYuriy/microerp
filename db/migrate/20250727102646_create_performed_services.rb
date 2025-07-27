class CreatePerformedServices < ActiveRecord::Migration[7.1]
  def change
    create_table :performed_services do |t|
      t.references :client, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true
      t.boolean :bonuses, default: false
      t.integer :total_price
      t.integer :payment_method
      t.datetime :date

      t.timestamps
    end
  end
end
