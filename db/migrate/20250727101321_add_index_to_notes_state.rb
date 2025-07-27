class AddIndexToNotesState < ActiveRecord::Migration[7.1]
  def change
    add_index :notes, :state
  end
end
