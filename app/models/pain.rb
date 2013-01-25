class Pain < ActiveRecord::Base
  attr_accessible :bodypart, :name, :description
  belongs_to :user
  validates :name, presence: true
  validates :bodypart, presence: true
  validates :user_id, presence: true
end
