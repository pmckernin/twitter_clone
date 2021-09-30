class PostsController < ApplicationController
  before_action :current_user_must_be_post_user,
                only: %i[edit update destroy]

  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).includes(:user, :likes,
                                                :fans).page(params[:page]).per(10)
  end

  # GET /posts/1
  def show
    @like = Like.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      message = "Post was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @post, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to @post, notice: "Post was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy
    message = "Post was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to posts_url, notice: message
    end
  end

  private

  def current_user_must_be_post_user
    set_post
    unless current_user == @post.user
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def post_params
    params.require(:post).permit(:user_id, :body, :reply_to_id, :repost_of_id)
  end
end
