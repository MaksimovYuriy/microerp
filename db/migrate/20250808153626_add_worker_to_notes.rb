class AddWorkerToNotes < ActiveRecord::Migration[7.1]
  def change
    add_reference :notes, :worker, foreign_key: true
  end
end
