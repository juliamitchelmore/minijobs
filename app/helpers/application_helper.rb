module ApplicationHelper
  def user_type
    return 'kid' if current_kid.present?
    return 'adult' if current_adult.present?
  end

  def current_user
    current_kid || current_adult
  end
end
