class DaysController < ApplicationController
  #load_and_authorize_resource
  respond_to :html, :json 
  
  def index
    @days = @daily_entries = current_user.daily_entries.order("date ASC").all
  end
end