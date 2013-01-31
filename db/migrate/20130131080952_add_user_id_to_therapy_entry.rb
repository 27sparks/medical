class AddUserIdToTherapyEntry < ActiveRecord::Migration
  def change
    add_column :therapy_entries, :user_id, :integer
  end
end
