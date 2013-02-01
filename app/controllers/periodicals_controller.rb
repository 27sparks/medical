class PeriodicalsController < ApplicationController
  def day
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end

  def week
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end

  def month
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end

  def year
    @pain_entries = PainEntry.where(user_id: current_user.id).all
  end
end
