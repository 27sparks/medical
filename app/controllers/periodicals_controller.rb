class PeriodicalsController < ApplicationController
  
  def day
    @date = params[:date] ? params[:date].to_date : Time.new.to_date
    @daily_entry = current_user.daily_entries.find_by_date(@date)
    @pain_entries = current_user.pain_entries.where( :date => @date)
    @therapy_entries =  current_user.therapy_entries.where(:date => @date)
  end

  def week
    date = params[:date] ? params[:date].to_date : Time.new.to_date
    @date = date.beginning_of_week.to_date
    @pain_entries = current_user.pain_entries.where( :date => @date..@date + 7.days ).group_by{ |item| item.date.to_date }
    @therapy_entries =  current_user.therapy_entries.where( :date => @date..@date + 7.days ).group_by{ |item| item.date.to_date }
  end
  
  def month
    @date = params[:date] ? params[:date].to_date : Time.new.to_date
  end

  def year
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end
  
end
