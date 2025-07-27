class CreateServiceMaterialLogs < ActiveRecord::Migration[7.1]
  def change
    create_table :service_material_logs do |t|
      t.references :service_material, null: false, foreign_key: true
      t.datetime :date

      t.timestamps
    end
  end
end
