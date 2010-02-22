class SnippetsController < ApplicationController
  before_filter :check_authorization, :only=>[:edit,:update,:destroy]
  helper_method :can_edit?

  # GET /snippets
  # GET /snippets.xml
  def index
    @snippets = Snippet.paginate :per_page => 10, :page => params[:page], :order=> 'updated_at DESC'

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @snippets }
    end
  end

  # GET /snippets/1
  # GET /snippets/1.xml
  def show
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @snippet }
      format.text { render :text => @snippet.code }
      format.json { render :json => @snippet.to_json }
    end
  end

  def fullscreen
    @snippet = Snippet.find(params[:id])
    render :layout => false
  end

  # GET /snippets/new
  # GET /snippets/new.xml
  def new
    @snippet = Snippet.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @snippet }
    end
  end

  # GET /snippets/1/edit
  def edit
    @snippet = Snippet.find(params[:id])
  end

  # POST /snippets
  # POST /snippets.xml
  def create
    @snippet = Snippet.new(params[:snippet])

    respond_to do |format|
      if @snippet.save
        owns!(@snippet.id)
        flash[:notice] = 'Snippet was successfully created.'
        format.html { redirect_to(@snippet) }
        format.xml  { render :xml => @snippet, :status => :created, :location => @snippet }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /snippets/1
  # PUT /snippets/1.xml
  def update
    @snippet = Snippet.find(params[:id])

    respond_to do |format|
      if @snippet.update_attributes(params[:snippet])
        flash[:notice] = 'Snippet was successfully updated.'
        format.html { redirect_to(@snippet) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @snippet.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /snippets/1
  # DELETE /snippets/1.xml
  def destroy
    @snippet = Snippet.find(params[:id])
    @snippet.destroy

    respond_to do |format|
      format.html { redirect_to(snippets_url) }
      format.xml  { head :ok }
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
