class ContentController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard]
  def index
  end

  def dashboard
    render 'kid/dashboard' and return if current_user.is_a? Kid
    render 'adult/parent_dashboard' and return if current_user.parent?
    render 'adult/lister_dashboard' and return if current_user.adult?
  end
end
