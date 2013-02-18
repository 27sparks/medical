json.array!(@pain_entries) do |entry|

  json.value entry.value 
  json.duration entry.duration
  json.date entry.date
  json.day entry.date.day
  json.month entry.date.month
  json.year entry.date.year
end
