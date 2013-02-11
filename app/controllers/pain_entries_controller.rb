class PainEntriesController < ApplicationController
  load_and_authorize_resource
  
  def index
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end

  def show
    render "edit"
  end

  def new
    date = params[:date] ? params[:date] : Time.new.to_date
    @pain_entry = current_user.pain_entries.new(date: date, value: 20)
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
