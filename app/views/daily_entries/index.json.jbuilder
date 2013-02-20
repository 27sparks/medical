json.array!(@daily_entries) do |entry|
  json.weight entry.weight
  json.emotion entry.emotion
  json.pain entry.pain
  json.date entry.date
  json.menstruation entry.menstruation
  json.day entry.date.day
  json.month entry.date.month
  json.year entry.date.year
end
