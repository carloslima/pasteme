ActionController::Routing::Routes.draw do |map|
  map.resources :snippets

  map.root :controller => "snippets", :action => "new"
end
