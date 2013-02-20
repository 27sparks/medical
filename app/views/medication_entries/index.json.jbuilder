json.array!(@medication_entries) do |entry|
  json.comment entry.comment
  json.occured_at entry.taken_at 
  json.date entry.date
  json.day entry.date.day
  json.month entry.date.month
  json.year entry.date.year
  json.value entry.dose
  json.name entry.name
end
