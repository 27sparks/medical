module PainEntriesHelper
  def pain_description entry
    case entry.value
    when 1..20 
      degree = "etwas"
    when 21..40
      degree = "leicht"
    when 41..60
      degree = "mittel"
    when 61..80
      degree = "stark"
    when 81..100
      degree = "sehr stark"
    end
    
    "#{entry.duration} #{entry.body_part} #{entry.side} #{degree} #{entry.pain_type}"
  end
end
