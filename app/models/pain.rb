class Pain < ActiveRecord::Base
  attr_accessible :bodypart, :name
  
  validates :name, presence: true
  validates :bodypart, presence: true
end
