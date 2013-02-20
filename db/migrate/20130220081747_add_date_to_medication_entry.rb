class AddDateToMedicationEntry < ActiveRecord::Migration
  def change
    add_column :medication_entries, :date, :date
  end
end
