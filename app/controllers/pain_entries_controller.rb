class PainEntriesController < ApplicationController
  # GET /pain_entries
  # GET /pain_entries.json
  def index
    @pain_entries = PainEntry.where(user_id: current_user.id).all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pain_entries }
    end
  end

  # GET /pain_entries/1
  # GET /pain_entries/1.json
  def show
    @pain_entry = PainEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pain_entry }
    end
  end

  # GET /pain_entries/new
  # GET /pain_entries/new.json
  def new
    @pain_entry = PainEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pain_entry }
    end
  end

  # GET /pain_entries/1/edit
  def edit
    @pain_entry = PainEntry.find(params[:id])
  end

  # POST /pain_entries
  # POST /pain_entries.json
  def create
    @pain_entry = current_user.pain_entries.new(params[:pain_entry])

    respond_to do |format|
      if @pain_entry.save
        format.html { redirect_to @pain_entry, notice: 'Pain entry was successfully created.' }
        format.json { render json: @pain_entry, status: :created, location: @pain_entry }
      else
        format.html { render action: "new" }
        format.json { render json: @pain_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pain_entries/1
  # PUT /pain_entries/1.json
  def update
    @pain_entry = PainEntry.find(params[:id])

    respond_to do |format|
      if @pain_entry.update_attributes(params[:pain_entry])
        format.html { redirect_to @pain_entry, notice: 'Pain entry was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pain_entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pain_entries/1
  # DELETE /pain_entries/1.json
  def destroy
    @pain_entry = PainEntry.find(params[:id])
    @pain_entry.destroy

    respond_to do |format|
      format.html { redirect_to pain_entries_url }
      format.json { head :no_content }
    end
  end
end
