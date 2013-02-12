module DailyEntriesHelper

  def pain_degree_in_words value
    case value
    when 1..20 
      degree = "etwas"
    when 21..40
      degree = "leichte"
    when 41..60
      degree = "mittelstarke"
    when 61..80
      degree = "starke"
    when 81..100
      degree = "sehr starke"
    end
  end
  
  def emotion_degree_in_words value
    case value
    when 1..20 
      degree = "sehr schlecht"
    when 21..40
      degree = "schlechter"
    when 41..60
      degree = "normal"
    when 61..80
      degree = "gut"
    when 81..100
      degree = "sehr gut"
    end
  end
  
  def weight_tendency entry, date
    days_before = DailyEntry.where("date < ?", date).order("date DESC").first
    if days_before
      if entry.weight > days_before.weight 
        "up"
      elsif entry.weight < days_before.weight
        "down"
      else
        "right"
      end
    else
      "#{entry.weight} kg"
    end
  end
end
