class AddEmotionAndPainAndWeightToDailyEntry < ActiveRecord::Migration
  def change
    add_column :daily_entries, :emotion, :integer
    add_column :daily_entries, :pain, :integer
    add_column :daily_entries, :weight, :float
  end
end
