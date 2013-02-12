json.array!(@pain_entries) do |entry|
  json.created_at entry.created_at
  json.updated_at entry.updated_at
  json.comment entry.comment
  json.value entry.value 
  json.pain_type entry.pain_type 
  json.body_part entry.body_part
  json.duration entry.duration
  json.side entry.side 
  json.occured_at entry.occured_at 
  json.date entry.date
end
