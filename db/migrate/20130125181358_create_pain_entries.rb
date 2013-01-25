class CreatePainEntries < ActiveRecord::Migration
  def change
    create_table :pain_entries do |t|
      t.integer :pain_id
      t.integer :user_id
      t.integer :value
      t.string :comment

      t.timestamps
    end
  end
end
