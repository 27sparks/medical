json.array!(@therapy_entries) do |entry|
  json.created_at entry.created_at
  json.updated_at entry.updated_at
  json.duration entry.duration 
  json.intensity entry.intensity 
  json.therapy_type entry.therapy_type
  json.comment entry.comment
  json.occured_at entry.occured_at 
  json.date entry.date
  json.day entry.date.day
  json.month entry.date.month
  json.year entry.date.year
  json.value entry.duration
end
