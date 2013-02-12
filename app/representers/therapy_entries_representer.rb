require 'representable/json/collection'

module TherapyEntriesRepresenter
  include Representable::JSON::Collection
  items extend: TherapyEntryRepresenter
end
