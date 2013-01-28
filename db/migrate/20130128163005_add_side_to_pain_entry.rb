class AddSideToPainEntry < ActiveRecord::Migration
  def change
    add_column :pain_entries, :side, :string
  end
end
