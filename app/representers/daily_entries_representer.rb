require 'representable/json/collection'

module DailyEntriesRepresenter
  include Representable::JSON::Collection
  items extend: DailyEntryRepresenter
end
