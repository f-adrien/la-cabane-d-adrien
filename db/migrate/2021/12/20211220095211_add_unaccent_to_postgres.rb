class AddUnaccentToPostgres < ActiveRecord::Migration[6.1]
  def change
    enable_extension 'unaccent' if Rails.env == 'development'
  end
end
