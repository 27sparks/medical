require 'representable/json'

module DailyEntryRepresenter
  include Representable::JSON
  property :created_at
  property :updated_at
  property :weight 
  property :emotion 
  property :pain 
  property :date 
  property :menstruation
end