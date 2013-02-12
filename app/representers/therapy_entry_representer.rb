require 'representable/json'

module TherapyEntryRepresenter
  include Representable::JSON
  property :created_at
  property :updated_at
  property :comment 
  property :duration 
  property :intensity
  property :therapy_type 
  property :user_id
  property :occured_at
  property :date
end