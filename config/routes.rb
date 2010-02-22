ActionController::Routing::Routes.draw do |map|
  map.resources :snippets, :member => {:fullscreen=>:get}
  map.root :controller => "snippets", :action => "new"
end
