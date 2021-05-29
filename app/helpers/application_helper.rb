module ApplicationHelper
  def svg(name)
    file_path = "#{Rails.root}/app/assets/images/svgs/#{name}.svg"
    return File.read(file_path).html_safe if File.exist?(file_path)
    
    '(NO ICON)'
  end
end
