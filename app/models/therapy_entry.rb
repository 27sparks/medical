class TherapyEntry < ActiveRecord::Base
  attr_accessible :comment, :duration, :intensity, :therapy_type, :user_id, :occured_at, :date
  belongs_to :user
end
