class AddSleepToDailyEntries < ActiveRecord::Migration
  def change
    add_column :daily_entries, :sleep, :float
  end
end
