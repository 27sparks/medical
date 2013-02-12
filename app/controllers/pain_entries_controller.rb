class PainEntriesController < ApplicationController
  load_and_authorize_resource
  respond_to :html, :json 
  
  def index
    @pain_entries = current_user.pain_entries.all
  end

  def show
    pain_entry = PainEntry.first
    pain_entry.extend(PainEntryRepresenter).to_json
    respond_with pain_entry
  end

  def new
    date = params[:date] ? params[:date] : Time.new.to_date
    @pain_entry = current_user.pain_entries.new(date: date, value: 20, occured_at: "mittags", side: "mitte")
  end

  def edit
  end

  def create
    @pain_entry = current_user.pain_entries.new(params[:pain_entry])

    respond_to do |format|
      if @pain_entry.save
        format.html { redirect_to day_path(@pain_entry.date), notice: 'Entry was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @pain_entry = PainEntry.find(params[:id])

    respond_to do |format|
      if @pain_entry.update_attributes(params[:pain_entry])
        format.html { redirect_to day_path(@pain_entry.date), notice: 'Entry was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @pain_entry = PainEntry.find(params[:id])
    @pain_entry.destroy

    respond_to do |format|
      format.html { redirect_to day_path }
      format.js
    end
  end
end
