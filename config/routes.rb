Rails.application.routes.draw do
  devise_for :candidates
  devise_for :users
 
  namespace :administrator, path: '/administrar' do 
    authenticate :user do 
      root "projects#index"

      resources :projects do 
        resources :enrollments
        resources :participations
        resources :navs
        resources :pages
        resources :winners
      end
    end
  end

  namespace :contest, path: '/' do 
    authenticate :candidate do 
      root "candidate_enrollments#index"

      resources :code_enrollments
      resources :messages
      resources :status_enrollments
      resources :users do
        resources :user_project_privileges
      end
    end
  end

end
