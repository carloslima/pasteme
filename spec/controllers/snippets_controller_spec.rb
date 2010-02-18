require 'spec_helper'

describe SnippetsController do

  def mock_snippet(stubs={})
    @mock_snippet ||= mock_model(Snippet, stubs)
  end

  describe "GET index" do
    it "assigns all snippets as @snippets" do
      snippet = Factory(:snippet)
      get :index
      assigns[:snippets].should == [snippet]
    end
  end

  describe "GET show" do
    it "assigns the requested snippet as @snippet" do
      Snippet.stub(:find).with("37").and_return(mock_snippet)
      get :show, :id => "37"
      assigns[:snippet].should equal(mock_snippet)
    end
  end

  describe "GET new" do
    it "assigns a new snippet as @snippet" do
      Snippet.stub(:new).and_return(mock_snippet)
      get :new
      assigns[:snippet].should equal(mock_snippet)
    end
  end

  describe "GET edit" do
    it "assigns the requested snippet as @snippet" do
      Snippet.stub(:find).with("37").and_return(mock_snippet)
      get :edit, :id => "37"
      assigns[:snippet].should equal(mock_snippet)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created snippet as @snippet" do
        Snippet.stub(:new).with({'these' => 'params'}).and_return(mock_snippet(:save => true))
        post :create, :snippet => {:these => 'params'}
        assigns[:snippet].should equal(mock_snippet)
      end

      it "redirects to the created snippet" do
        Snippet.stub(:new).and_return(mock_snippet(:save => true))
        post :create, :snippet => {}
        response.should redirect_to(snippet_url(mock_snippet))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved snippet as @snippet" do
        Snippet.stub(:new).with({'these' => 'params'}).and_return(mock_snippet(:save => false))
        post :create, :snippet => {:these => 'params'}
        assigns[:snippet].should equal(mock_snippet)
      end

      it "re-renders the 'new' template" do
        Snippet.stub(:new).and_return(mock_snippet(:save => false))
        post :create, :snippet => {}
        response.should render_template('new')
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested snippet" do
        Snippet.should_receive(:find).with("37").and_return(mock_snippet)
        mock_snippet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :snippet => {:these => 'params'}
      end

      it "assigns the requested snippet as @snippet" do
        Snippet.stub(:find).and_return(mock_snippet(:update_attributes => true))
        put :update, :id => "1"
        assigns[:snippet].should equal(mock_snippet)
      end

      it "redirects to the snippet" do
        Snippet.stub(:find).and_return(mock_snippet(:update_attributes => true))
        put :update, :id => "1"
        response.should redirect_to(snippet_url(mock_snippet))
      end
    end

    describe "with invalid params" do
      it "updates the requested snippet" do
        Snippet.should_receive(:find).with("37").and_return(mock_snippet)
        mock_snippet.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :snippet => {:these => 'params'}
      end

      it "assigns the snippet as @snippet" do
        Snippet.stub(:find).and_return(mock_snippet(:update_attributes => false))
        put :update, :id => "1"
        assigns[:snippet].should equal(mock_snippet)
      end

      it "re-renders the 'edit' template" do
        Snippet.stub(:find).and_return(mock_snippet(:update_attributes => false))
        put :update, :id => "1"
        response.should render_template('edit')
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested snippet" do
      Snippet.should_receive(:find).with("37").and_return(mock_snippet)
      mock_snippet.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the snippets list" do
      Snippet.stub(:find).and_return(mock_snippet(:destroy => true))
      delete :destroy, :id => "1"
      response.should redirect_to(snippets_url)
    end
  end

end
