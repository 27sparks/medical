class AddDateToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :date, :date
  end
end
