class AddOccuredAtToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :occured_at, :datetime
  end
end
