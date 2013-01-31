class RenameColumnTypeToTherapyTypeInTherapyEntry < ActiveRecord::Migration
  def up
    add_column :therapy_entries, :therapy_type, :string
  end

  def down
    remove_column :therapy_entries, :therapy_type, :string
  end
end
