Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api, defaults: {format: 'json'} do
    scope :v1 do
      match "find_ubs", :controller => 'basic_units', :action => 'find', via: [:get]
    end
  end
  
end
