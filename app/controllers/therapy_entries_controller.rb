class TherapyEntriesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json

  def index
    therapy_entries = current_user.therapy_entries.all
    therapy_entries.extend(TherapyEntriesRepresenter).to_json
    respond_with therapy_entries
  end

  def show
    render 'new'
  end

  def new
    date = params[:date] ? params[:date] : Time.new.to_date
    @therapy_entry = current_user.therapy_entries.new(:date => date)
  end

  def edit
  end

  def create
    @therapy_entry = current_user.therapy_entries.new(params[:therapy_entry])

    respond_to do |format|
      if @therapy_entry.save
        format.html { redirect_to day_path(@therapy_entry.date), notice: 'Entry was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
    
  end

  def update
    @therapy_entry = TherapyEntry.find(params[:id])

    respond_to do |format|
      if @therapy_entry.update_attributes(params[:therapy_entry])
        format.html { redirect_to day_path(@therapy_entry.date), notice: 'Entry was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /therapy_entries/1
  # DELETE /therapy_entries/1.json
  def destroy
    @therapy_entry = TherapyEntry.find(params[:id])
    @therapy_entry.destroy

    respond_to do |format|
      format.html { redirect_to current_user }
      format.js
    end
  end
end
