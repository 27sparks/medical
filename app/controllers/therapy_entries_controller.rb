class TherapyEntriesController < ApplicationController
  load_and_authorize_resource


  def index
    @therapy_entries = TherapyEntry.where(user_id: current_user.id).all
  end

  def show
    @therapy_entry = TherapyEntry.find(params[:id])
  end

  def new
    @therapy_entry = current_user.therapy_entries.new
  end

  def edit
  end

  def create
    @therapy_entry = current_user.therapy_entries.new(params[:therapy_entry])

    respond_to do |format|
      if @therapy_entry.save
        format.html { redirect_to current_user, notice: 'Entry was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
    
  end

  def update
    @therapy_entry = TherapyEntry.find(params[:id])

    respond_to do |format|
      if @therapy_entry.update_attributes(params[:therapy_entry])
        format.html { redirect_to current_user, notice: 'Entry was successfully updated.' }
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
    end
  end
end
