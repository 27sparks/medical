class DailyEntriesController < ApplicationController

  def index
    @daily_entries = current_user.daily_entries.order("date DESC").all

    respond_to do |format|
      format.html
      format.json { render json: @daily_entries }
    end
  end

  def show
    @daily_entry = DailyEntry.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render json: @daily_entry }
    end
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
        format.json { render json: @daily_entry, status: :created, location: @daily_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @daily_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @daily_entry = DailyEntry.find(params[:id])

    respond_to do |format|
      if @daily_entry.update_attributes(params[:daily_entry])
        format.html { redirect_to day_path(@daily_entry.date), notice: 'Daily entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @daily_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @daily_entry = DailyEntry.find(params[:id])
    @daily_entry.destroy

    respond_to do |format|
      format.html { redirect_to root_url }
    end
  end
end
