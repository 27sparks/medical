class MedicationEntriesController < ApplicationController
  
  def new
    date = params[:date] ? params[:date] : Time.new.to_date
    @medication_entry = current_user.medication_entries.new(date: date, taken_at: "mittags")
  end

  def edit
  end

  def create
    @medication_entry = current_user.medication_entries.new(params[:medication_entry])

    respond_to do |format|
      if @medication_entry.save
        format.html { redirect_to day_path(@medication_entry.date), notice: 'Entry was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @medication_entry = MedicationEntry.find(params[:id])

    respond_to do |format|
      if @medication_entry.update_attributes(params[:medication_entry])
        format.html { redirect_to day_path(@medication_entry.date), notice: 'Entry was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @medication_entry = MedicationEntry.find(params[:id])
    @medication_entry.destroy

    respond_to do |format|
      format.html { redirect_to day_path }
      format.js
    end
  end
end
