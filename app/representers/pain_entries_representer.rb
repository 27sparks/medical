require 'representable/json/collection'

module PainEntriesRepresenter
  include Representable::JSON::Collection
  items extend: PainEntryRepresenter
end
