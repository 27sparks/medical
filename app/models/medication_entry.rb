class MedicationEntry < ActiveRecord::Base
  attr_accessible :dose, :name, :taken_at, :date, :comment
  belongs_to :user
end
