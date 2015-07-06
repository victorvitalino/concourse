Rails.application.routes.draw do
  mount RedactorRails::Engine => '/redactor_rails'
  devise_for :candidates, controllers: {sessions: 'sessions', registrations: 'registrations'}
  devise_for :users,      controllers: {sessions: 'user_sessions'}
  
   
  get 'cities',       as: 'cities',   to: "informations#cities"
  get 'projects',     as: 'projects', to: "informations#projects"
  get 'project/:id',  as: 'project',  to: "informations#project_show"
  get 'page/:id',     as: 'page',     to: "informations#page_show"

  namespace :administrator, path: '/administrar' do 
    authenticate :user do 
      root "projects#index"
      resources :candidates
      resources :users
      resources :passwords
      
      resources :projects do 
        resources :enrollment_candidates
        resources :participation_candidates
        resources :winners

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
      root "enrollments#index"

      resources :enrollments, path: 'inscricoes' do
        resources :form_enrollments, path: 'inscricao'
      end
      
      resources :candidate_enrollments, path: 'minhas_inscricoes'
    end
  end

end
