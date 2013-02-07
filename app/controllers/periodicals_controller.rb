class PeriodicalsController < ApplicationController
  def day
    @date = params[:date] ? params[:date].to_date : Time.new.to_date
    @pain_entries = current_user.pain_entries.where( :date => @date)
    @therapy_entries =  current_user.therapy_entries.where(:date => @date)
  end

  def week
    @date = params[:date] ? params[:date].to_date : Time.new.to_date
    @pain_entries = current_user.pain_entries.where( :date => @date - 7.days..@date ).group_by{ |item| item.date.to_date }
    @therapy_entries =  current_user.therapy_entries.where( :date => @date - 7.days..@date ).group_by{ |item| item.date.to_date }
  end
  def month
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end

  def year
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end
end
