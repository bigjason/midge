Midge.setup do |config|
  config.jst_processor ".midge_template", <%= Rails.application.class.parent_name.inspect %>
  config.js_processor ".midge", <%= Rails.application.class.parent_name.inspect %>
end
