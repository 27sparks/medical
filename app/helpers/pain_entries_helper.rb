# encoding: UTF-8
module PainEntriesHelper
  def pain_description entry
    case entry.value
    when 1..20 
      degree = "etwas"
    when 21..40
      degree = "leichter"
    when 41..60
      degree = "mittelstarker"
    when 61..80
      degree = "starker"
    when 81..100
      degree = "sehr starker"
    end
    
    "#{entry.occured_at unless entry.duration == 'ganztägig'} #{entry.duration} #{degree}, #{entry.pain_type}er Schmerz #{entry.side} am #{entry.body_part}"
  end
end
