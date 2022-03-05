module ApplicationHelper
  def add_breadcrumbs(links)
    content_for(:breadcrumbs) do
      render 'shared/breadcrumbs', links: links
    end
  end

  def disable_turbo_preview
    content_for(:metas) do
      sanitize("<meta name='turbo-cache-control' content='no-preview'>", tags: %w[meta], attributes: %w[name content])
    end
  end

  def svg(name, options = {})
    file_path = "#{Rails.root}/app/assets/images/svgs/#{name}.svg"
    return '(NO ICON)' if File.exist?(file_path) == false

    file_content = File.read(file_path)
    if options[:class].blank?
      file_content.html_safe
    else
      Nokogiri::HTML(file_content).search('svg').append_class(options[:class]).to_html.html_safe
    end
  end
end
