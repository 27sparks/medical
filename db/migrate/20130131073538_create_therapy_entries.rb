class CreateTherapyEntries < ActiveRecord::Migration
  def change
    create_table :therapy_entries do |t|
      t.string :type
      t.string :intensity
      t.integer :duration
      t.string :comment

      t.timestamps
    end
  end
end
