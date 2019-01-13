module ApplicationHelper
  def render_qr_code(qr)
    content_tag :div, class: 'qr' do
      raw(@qr.as_html)
    end
  end

  def page_header(text)
    content_tag :h1, text, class: 'display-3'
  end

  def format_date(date)
    date.strftime('%A, %B %e, %Y at %l:%M %p')
  end

  def flash_class(level)
    case level.to_sym
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
      else "alert alert-info"
    end
  end
end
