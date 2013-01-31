class RemoveTimeFromPainEntry < ActiveRecord::Migration
  def up
    remove_column :pain_entries, :time
  end

  def down
    add_column :pain_entries, :time, :datetime
  end
end
