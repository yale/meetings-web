module ApplicationHelper
  def render_qr_code(qr)
    content_tag :div, class: 'qr' do
      raw(@qr.as_html)
    end
  end

  def page_header(text)
    content_tag :h1, text, class: 'mt-5'
  end
end
