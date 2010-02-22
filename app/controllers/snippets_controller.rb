class SnippetsController < ApplicationController
  before_filter :check_authorization, :only=>[:edit,:update,:destroy]
  helper_method :can_edit?

  # GET /snippets
  def index
    @snippets = Snippet.paginate :page => params[:page], :order=> 'updated_at DESC'

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /snippets/1
  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.text { render :text => @snippet.code }
      format.json { render :json => @snippet.to_json }
    end
  end

  # GET /snippets/1/fullscreen
  def fullscreen
    @snippet = Snippet.find(params[:id])
    render :layout => false
  end

  # GET /snippets/new
  def new
    @snippet = Snippet.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /snippets/1/edit
  def edit
    @snippet = Snippet.find(params[:id])
  end

  # POST /snippets
  def create
    @snippet = Snippet.new(params[:snippet])

    respond_to do |format|
      if @snippet.save
        owns!(@snippet.id)
        flash[:notice] = 'Snippet was successfully created.'
        format.html { redirect_to(@snippet) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /snippets/1
  def update
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      if @snippet.update_attributes(params[:snippet])
        flash[:notice] = 'Snippet was successfully updated.'
        format.html { redirect_to(@snippet) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /snippets/1
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to(snippets_url) }
    end
  end

  private
  # We use a simple approach to "authorization"
  # The session that created the snippet can edit/delete it
  # while the session is valid.
  # This should be good enough for small corrections

  def owns! snippet_id
    session[:owns] ||= []
    session[:owns] << snippet_id.to_i
  end
  def owns? snippet_id
    session[:owns] ||= []
    session[:owns].include? snippet_id.to_i
  end
  def can_edit?
    owns?(params[:id])
  end
  def check_authorization
    unless can_edit?
      flash[:error] = "Sorry, you can't do that!"
      redirect_to(:action=>:show)
    end
  end
end
