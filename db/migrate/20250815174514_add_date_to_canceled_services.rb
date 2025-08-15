class AddDateToCanceledServices < ActiveRecord::Migration[7.1]
  def change
    add_column :canceled_services, :date, :datetime, null: false
  end
end
