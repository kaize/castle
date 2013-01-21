Castle::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'

  scope module: :web do
    root to: "welcome#index"

    namespace :admin do
      root to: "welcome#index"

      resources :unions
      resources :categories
      resources :groups
      resources :instructors

      resources :news
      resources :pages
    end

    resources :news, only: [:index, :show]
    resources :page, only: [:show]
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

  end

end
