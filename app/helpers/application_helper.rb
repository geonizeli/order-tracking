module ApplicationHelper
  include Pagy::Frontend

  def show_time_ago_if_recent(time)
    if time > 24.hour.ago
      time_tag(time,  'data-local': 'time-ago')
    else
      time_tag(time)
    end
  end
end
