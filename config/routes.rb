Rails.application.routes.draw do
  post "/ifttt/callbacks" => "ifttt_callback#create", format: "json"
  post "/line/callbacks"  => "line_callback#create",  format: "json"
end
