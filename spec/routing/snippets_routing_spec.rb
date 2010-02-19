require 'spec_helper'

describe SnippetsController do
  describe "routing" do
    it "recognizes and generates #index" do
      { :get => "/snippets" }.should route_to(:controller => "snippets", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/snippets/new" }.should route_to(:controller => "snippets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/snippets/1" }.should route_to(:controller => "snippets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/snippets/1/edit" }.should route_to(:controller => "snippets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/snippets" }.should route_to(:controller => "snippets", :action => "create") 
    end

    it "recognizes and generates #update" do
      { :put => "/snippets/1" }.should route_to(:controller => "snippets", :action => "update", :id => "1") 
    end

    it "recognizes and generates #destroy" do
      { :delete => "/snippets/1" }.should route_to(:controller => "snippets", :action => "destroy", :id => "1") 
    end
  end
end
