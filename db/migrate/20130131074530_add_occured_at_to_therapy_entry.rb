class AddOccuredAtToTherapyEntry < ActiveRecord::Migration
  def change
    add_column :therapy_entries, :occured_at, :string
  end
end
