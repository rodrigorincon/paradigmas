Rails.application.routes.draw do
  match 'images' => 'images#create',  via: :post
  match 'images/:id/:size' => 'images#show',  via: :get
end
