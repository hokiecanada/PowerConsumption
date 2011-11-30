P2::Application.routes.draw do
  resources :outlets do
	resources :logs
  end

  match "/outlets/:id/graph_code" => "outlets#graph_code"
  match "/outlets/:id/graph" => "outlets#graph"
  
  root :to => 'outlets#index'

end
