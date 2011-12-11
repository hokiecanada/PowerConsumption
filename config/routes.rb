P2::Application.routes.draw do
  resources :outlets do
	resources :logs
  end

  match "/outlets/:id/graph_code" => "outlets#graph_code"
  match "/outlets/:id/graph" => "outlets#graph"
  match "/outlets/:id/graph1" => "outlets#graph1"
  match "/outlets/:id/graph2" => "outlets#graph2"
  match "/outlets/:id/graph3" => "outlets#graph3"
  
  root :to => 'outlets#index'

end
