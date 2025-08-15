class CreateCanceledServices < ActiveRecord::Migration[7.1]
  def change
    create_table :canceled_services do |t|
      t.references :client, null: false, foreign_key: true
      t.references :service, null: false, foreign_key: true
      t.references :worker, null: false, foreign_key: true

      t.timestamps
    end
  end
end
