require 'representable/json'

module PainEntryRepresenter
  include Representable::JSON
  property :created_at
  property :updated_at
  property :date
  property :occured_at
  property :value
  property :duration
  property :pain_type
  property :body_part
  property :side
  property :comment
end