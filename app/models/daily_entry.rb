class DailyEntry < ActiveRecord::Base
  attr_accessible :weight, :emotion, :pain, :date
  belongs_to :user
  
end
