module ApplicationHelper

  def development?
    Rails.env.starts_with? 'd'
  end

  def production?
    Rails.env.starts_with? 'p'
  end
end
