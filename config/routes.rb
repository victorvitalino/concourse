Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :candidates, controllers: {sessions: 'sessions', registrations: 'registrations'}
  devise_for :users
  
   
  get 'cities', as: 'cities', to: "informations#cities"

  namespace :administrator, path: '/administrar' do 
    authenticate :user do 
      root "projects#index"
      resources :candidates
      resources :users
      resources :passwords
      
      resources :projects do 
        resources :enrollment_candidates
        resources :participation_candidates

        resources :participations
        resources :enrollments
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
