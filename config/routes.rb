Rails.application.routes.draw do
  devise_for :users,
             controllers: {
                 sessions: 'users/sessions',
                 registrations: 'users/registrations'
             }
  namespace :api do
    namespace :v1 do
      resources :tasks do
        resources :subtasks, only: [:index, :create, :update, :destroy]
      end
    end
  end
end
