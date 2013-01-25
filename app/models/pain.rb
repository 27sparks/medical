class Pain < ActiveRecord::Base
  attr_accessible :bodypart, :name, :description
  belongs_to :user
  has_many :pain_entries
  validates :name, presence: true
  validates :bodypart, presence: true
  validates :user_id, presence: true
end
