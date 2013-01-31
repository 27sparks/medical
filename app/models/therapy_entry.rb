class TherapyEntry < ActiveRecord::Base
  attr_accessible :comment, :duration, :intensity, :type, :user_id
  belongs_to :user
end
