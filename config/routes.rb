Castle::Application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  namespace :api do
    resources :events, only: [:index]

    namespace :admin do
      resources :study_requests, only: [:index]
      resources :blocks, only: [] do
         put :mass_update_order, on: :collection
      end
      resources :partners, only: [] do
         put :mass_update_order, on: :collection
      end
      resources :menu_items, only: [] do
        scope module: :menu_items do
          resources :pages, only: [] do
            put :mass_update_order, on: :collection
          end
        end
      end

    end
  end

  scope module: :web do
    root to: "welcome#index"

    namespace :admin do
      root to: "welcome#index"
      resource :session, only: [:new, :create, :destroy]
      resources :study_requests, only: [:index, :show, :destroy]
      resources :unions
      resources :group_schedule_classrooms
      resources :categories
      resources :groups
      resources :instructors
      resources :photo_albums
      resources :news
      resources :partners
      resources :events
      resources :blocks
      resources :menu_items do
        scope module: :menu_items do
          resources :pages
        end
      end
    end

    resource :search, only: [:show]
    resources :news, only: [:index, :show]
    resources :pages, only: [:show]
    resources :categories, only: [:index, :show] do
      scope module: :categories do
        resources :unions, only: [:index, :show]
      end
    end

    scope module: :categories do
      resources :unions, only: [:show] do
        scope module: :unions do
          resources :groups, only: [:show]
        end
      end
    end

    resources :schedules, only: [:index, :show]
    resources :instructors, only: [:index, :show]
    resources :photo_albums, only: [:index, :show]
    resources :study_requests
    resources :events, only: [:index, :show]
  end

end
