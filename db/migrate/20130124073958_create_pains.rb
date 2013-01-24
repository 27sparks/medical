class CreatePains < ActiveRecord::Migration
  def change
    create_table :pains do |t|
      t.string :name
      t.string :bodypart

      t.timestamps
    end
  end
end
