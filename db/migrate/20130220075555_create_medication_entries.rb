class CreateMedicationEntries < ActiveRecord::Migration
  def change
    create_table :medication_entries do |t|
      t.string :name
      t.float :dose
      t.string :taken_at

      t.timestamps
    end
  end
end
