Castle::Application.routes.draw do


  mount Ckeditor::Engine => '/ckeditor'

  scope module: :web do
    root to: "welcome#index"

    namespace :admin do
      root to: "welcome#index"
      resources :study_requests, only: [:index, :show, :destroy]
      resources :unions
      resources :categories
      resources :groups
      resources :instructors

      resources :news
      resources :pages
    end

    resources :news, only: [:index, :show]
    resources :page, only: [:show]
    resources :categories, only: [:show] do
      resources :unions, only: [:index, :show] do
        resources :groups, only: [:index, :show]
      end
    end
    resources :schedules, only: [:index, :show]
    resources :instructors, only: [:index, :show]
    resources :study_requests
  end

end
