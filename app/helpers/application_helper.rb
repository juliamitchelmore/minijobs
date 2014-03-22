module ApplicationHelper
  def user_type
    return 'kid' if current_kid.present?
    return 'adult' if current_adult.present?
  end
end
