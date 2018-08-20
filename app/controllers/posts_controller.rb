class PostsController < ApplicationController
  #before_action :set_post, only: [:show, :edit, :update, :destroy]
  
  def search
    @posts = Post.search do
      keywords params[:query]
    end.results
    
    respond_to do |format|
      format.html { render :action => "index" }
      format.xml { render :xml => @posts }
    end
  end
  
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all

  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
  end

  # GET /posts/new
  def new
    
    @lat = params[:lat].sub("a",".")
    @lng = params[:lng].sub("a",".")
    
    @post = Post.new(:x => @lat, :y => @lng)
    
    @post.x = params[:lat]
    @post.y = params[:lng]
    @post.save
    
    #query = "INSERT INTO post (x, y) VALUES ('#{@post.x}', '#{@post.y}')  "
    #query = "INSERT INTO bookmark (title , url, tags) VALUES (#{@user_new.title}, #{@user_new.url}, #{tags[0]})  "

    #Post.connection.execute(query);
  end
  
  def ajaxIndex
    if params[:post_id]
      @post = Post.find(params[:post_id])
    end
    respond_to do |format|
      format.js { render 'index.js.erb' }
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post =Post.find(params[:id])
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :hashtag, :x, :y)
    end
end
