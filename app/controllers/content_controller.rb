class ContentController < ApplicationController
  before_filter :authenticate_user!, only: [:dashboard, :profile]
  def index
  end

  def dashboard
    render 'kids/dashboard' and return if current_user.is_a? Kid
    render 'adults/parent_dashboard' and return if current_user.parent?
    render 'adults/lister_dashboard' and return if current_user.lister?
  end

  def profile
    redirect_to kid_path(current_user) and return if current_user.is_a? Kid
    render adult_path(current_user) and return
  end
end
