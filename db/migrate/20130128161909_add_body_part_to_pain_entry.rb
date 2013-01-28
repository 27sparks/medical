class AddBodyPartToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :body_part, :string
  end
end
