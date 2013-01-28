class AddPainTypeToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :pain_type, :string
  end
end
