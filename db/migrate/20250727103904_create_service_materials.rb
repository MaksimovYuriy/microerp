class CreateServiceMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :service_materials do |t|
      t.references :service, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.float :required_quantity, default: 0

      t.timestamps
    end
  end
end
