module ApplicationHelper
  def disable_turbo_preview
    content_for(:metas) do
      sanitize("<meta name='turbo-cache-control' content='no-preview'>", tags: %w[meta], attributes: %w[name content])
    end
  end

  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/svgs/#{name}.svg"
    return File.read(file_path).html_safe if File.exist?(file_path)
    
    '(NO ICON)'
  end
end
