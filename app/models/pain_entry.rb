class PainEntry < ActiveRecord::Base
  attr_accessible :comment, :value, :pain_type, :body_part, :duration, :side, :occured_at, :date
  belongs_to :user
  
  validates :user_id, presence: true
  validates :value, presence: true
end
