P2::Application.routes.draw do
  resources :outlets do
	resources :logs
  end

  match "/outlets/:id/graph_code" => "outlets#graph_code"
  match "/outlets/:id/graph" => "outlets#graph"
  match "/outlets/:id/graph1" => "outlets#graph1"
  match "/outlets/:id/graph2" => "outlets#graph2"
  match "/outlets/:id/graph3" => "outlets#graph3"
  match "/outlets/:id/detail1" => "outlets#detail1"
  match "/outlets/:id/detail2" => "outlets#detail2"
  match "/outlets/:id/detail3" => "outlets#detail3"
  match "power_off" => "outlets#power_off"
  match "power_on" => "outlets#power_on"
  match "outlets" => "outlets#index"
  
  match "/outlets/:id" => "outlets#show"
  
  root :to => 'outlets#index'

end
