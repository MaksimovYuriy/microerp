class CreateMaterials < ActiveRecord::Migration[7.1]
  def change
    create_table :materials do |t|
      t.string :name
      t.float :quantity, default: 0
      t.float :alert_quantity, default: 0

      t.timestamps
    end
  end
end
