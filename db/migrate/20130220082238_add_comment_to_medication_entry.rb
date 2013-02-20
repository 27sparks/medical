class AddCommentToMedicationEntry < ActiveRecord::Migration
  def change
    add_column :medication_entries, :comment, :string
  end
end
