class DailyEntriesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json 

  def index
    date = params[:date].present? ? params[:date].to_date : Time.new.to_date
    @daily_entries = current_user.daily_entries.where( :date => date.beginning_of_month..date.end_of_month )
  end

  def new
    date = params[:date] ? params[:date] : Time.new.to_date
    @daily_entry = current_user.daily_entries.find_or_initialize_by_date(date)
    respond_to do |format|
      format.html
    end
  end

  def edit
    @daily_entry = DailyEntry.find(params[:id])
  end

  def create
    @daily_entry = current_user.daily_entries.new(params[:daily_entry])

    respond_to do |format|
      if @daily_entry.save
        format.html { redirect_to day_path(@daily_entry.date), notice: 'Daily entry was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @daily_entry = DailyEntry.find(params[:id])

    respond_to do |format|
      if @daily_entry.update_attributes(params[:daily_entry])
        format.html { redirect_to day_path(@daily_entry.date), notice: 'Daily entry was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @daily_entry = DailyEntry.find(params[:id])
    @daily_entry.destroy

    respond_to do |format|
      format.html { redirect_to day_path(@daily_entry.date) }
    end
  end
end
