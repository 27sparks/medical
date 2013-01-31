class RemoveOccuredAtFromPainEntry < ActiveRecord::Migration
  def up
    remove_column :pain_entries, :occured_at
  end

  def down
    add_column :pain_entries, :occured_at, :datetime
  end
end
