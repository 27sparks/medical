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
    "#{entry.occured_at unless entry.duration == 'ganztägig'} #{entry.duration} #{degree}, #{entry.pain_type} #{entry.side} am #{entry.body_part}"
  end
  
  def short_pain_description entry
    "#{entry.duration} #{entry.pain_type} #{entry.side} am #{entry.body_part}"
  end
  
  def add_up_values entries
    value = 0
    if entries.present?
      entries.each do |e|
        value += e.value
      end
    end
    value 
  end
  
  def generate_color_from_value value
    if value == nil
      value = 0
    elsif value >= 220
      value = 220
    end
    red = 240
    green = 220 - (value)
    blue = 0
    value > 10 ? "rgb(#{red},#{green},#{blue})" : "#0088cc"
  end
  
end
