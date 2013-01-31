class AddDateToTherapyEntry < ActiveRecord::Migration
  def change
    add_column :therapy_entries, :date, :date
  end
end
