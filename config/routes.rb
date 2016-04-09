Rails.application.routes.draw do
  post "/callbacks" => "callback#create", format: "json"
end
