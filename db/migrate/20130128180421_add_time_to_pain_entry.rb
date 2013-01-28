class AddTimeToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :time, :datetime
  end
end
