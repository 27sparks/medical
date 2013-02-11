class CreateDailyEntries < ActiveRecord::Migration
  def change
    create_table :daily_entries do |t|

      t.timestamps
    end
  end
end
