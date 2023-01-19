Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'import_csv', to: 'movies#import_csv'
      get 'movies/:type/:value', to: 'movies#get_movies'
    end
  end
end
