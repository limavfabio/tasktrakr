# frozen_string_literal: true

module ApplicationHelper
  def format_time(time)
    time.in_time_zone('Brasilia').strftime('%H:%M')
  end
end
