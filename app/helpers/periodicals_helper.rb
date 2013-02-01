module PeriodicalsHelper
  def periodicals_action?(action)
    params[:controller] == "periodicals" && params[:action] == action.to_s
  end 
end
