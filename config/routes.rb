GestionFe::Application.routes.draw do








  resources :activities
  resources :allocated_figures


  scope "api" do
    match 'actividad_unica/:id' => 'activities#consulta_una_actividad'
    match 'cursos_por_municipio/:id' => 'courses#show_courses_by_municipality'
    match 'consulta_de_las_actividades/:id' => 'activities#consulta_actividades'
    match 'consulta_de_padron/' => 'padron#show_people_from_padron'
    match 'consulta_personas_asignadas/' => 'people#show_people_from_state'
    match 'consulta_asignadas/' => 'people#show_people_from_asignados'
    match 'consulta_localidades/:id' => 'localities#show_many_municipalities'
    match 'cursos_habilitados' => 'courses#show_habilitados'
    match 'consulta_municipios/:id' => 'municipalities#show_many'

    resources :role_statuses

    resources :padron
    resources :people
    resources :training_courses
    resources :modalities
    resources :localities
    resources :courses
    resources :education_types
    resources :municipalities
    resources :language
    resources :course_statuses
    resources :states
    resources :education_levels
    resources :school_types
  end


  root to: "main#index"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
