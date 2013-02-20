json.array!(@daily_entries) do |entry|
  json.emotion entry.emotion
  json.pain entry.pain
  json.date entry.date
  json.menstruation entry.menstruation
  json.weight entry.weight
end
