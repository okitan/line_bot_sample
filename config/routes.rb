Rails.application.routes.draw do
  post "/line/callbacks"  => "line_callback#create",  format: "json"
end
