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
end
