class AddMenstruationToDailyEntries < ActiveRecord::Migration
  def change
    add_column :daily_entries, :menstruation, :boolean
  end
end
