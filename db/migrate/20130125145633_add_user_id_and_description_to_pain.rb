class AddUserIdAndDescriptionToPain < ActiveRecord::Migration
  def change
    add_column :pains, :user_id, :integer
    add_column :pains, :description, :text
  end
end
