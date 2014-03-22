class ContentController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard, :profile]
  def index
  end

  def dashboard
    render 'kid/dashboard' and return if current_user.is_a? Kid
    render 'adult/parent_dashboard' and return if current_user.parent?
    render 'adult/lister_dashboard' and return if current_user.lister?
  end

  def profile
    redirect_to kid_path(current_user) and return if current_user.is_a? Kid
    render adult_path(current_user) and return
  end
end
