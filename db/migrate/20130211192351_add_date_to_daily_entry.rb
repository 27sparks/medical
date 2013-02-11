class AddDateToDailyEntry < ActiveRecord::Migration
  def change
    add_column :daily_entries, :date, :date
  end
end
