class AddDurationToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :duration, :string
  end
end
