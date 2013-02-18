class DailyEntry < ActiveRecord::Base
  attr_accessible :weight, :emotion, :pain, :date, :menstruation, :sleep
  belongs_to :user
end
