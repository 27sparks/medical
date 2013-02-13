module PeriodicalsHelper
  def periodicals_action?(action)
    params[:controller] == "periodicals" && params[:action] == action.to_s
  end 
  
  def generate_color_from_date date
    if date == Date.today
      "#fff3f3"
    else
      ""
    end
  end
  
  def month_year_from_numbers month, year
    "#{t('date.month_names')[month.to_i]} #{year}"
  end
end
