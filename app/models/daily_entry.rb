class DailyEntry < ActiveRecord::Base
  attr_accessible :weight, :emotion, :pain, :date, :menstruation
  belongs_to :user
end
