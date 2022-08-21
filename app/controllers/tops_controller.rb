class TopsController < ApplicationController
  before_action :move_to_index,except: :index
  
  
  def index
  end
  
  def help
  end

  private

  def move_to_index
    unless user_signed_in?
      redirect_to controller: :tops, action: :index
    end
  end
end