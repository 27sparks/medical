class PainsController < ApplicationController
  load_and_authorize_resource
    
  def show
  end
  
  def index
  end
  
  def new
  end
  
  def create
    if @pain.save
      flash[:success] = t(:you_have_created_a_new_pain_kind)
      redirect_to pains_path
    else
      render 'new'
    end
  end


end
