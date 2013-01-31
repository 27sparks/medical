class ReaddOccuredAtToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :occured_at, :string
  end
end
