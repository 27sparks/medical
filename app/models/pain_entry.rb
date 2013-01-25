class PainEntry < ActiveRecord::Base
  attr_accessible :comment, :value, :pain_id
  belongs_to :pain
  belongs_to :user
  
  validates :pain_id, presence: true
  validates :user_id, presence: true
  validates :value, presence: true
end
