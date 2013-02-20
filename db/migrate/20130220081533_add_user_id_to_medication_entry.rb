class AddUserIdToMedicationEntry < ActiveRecord::Migration
  def change
    add_column :medication_entries, :user_id, :integer
  end
end
