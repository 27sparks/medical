class RemovePainIdFromPainEntry < ActiveRecord::Migration
  def up
    remove_column :pain_entries, :pain_id
  end

  def down
    add_column :pain_entries, :pain_id, :integer
  end
end
