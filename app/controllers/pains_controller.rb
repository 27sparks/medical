class PainsController < ApplicationController
  load_and_authorize_resource
    
  def show
  end
  
  def index
  end
  
  def new
  end
  
  def create
    @pain = current_user.pains.new(params[:pain])
    if @pain.save
      flash[:success] = t(:you_have_created_a_new_pain_kind)
      redirect_to pains_path
    else
      render 'new'
    end
  end
  
  def edit
  end
  
  def update
    if @pain.update_attributes(params[:pain])
      flash[:success] = t(:updated_pain)
      redirect_to @pain
    else
      flash[:error] = t(:error_could_not_save_data)
      render 'edit'
    end
  end

  def destroy
    Pain.find(params[:id]).destroy
    flash[:success] = "Pain kind deleted."
    redirect_to root_url
  end
  


end
