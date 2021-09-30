class FollowsController < ApplicationController
  before_action :current_user_must_be_follow_leader,
                only: %i[edit update destroy]

  before_action :set_follow, only: %i[show edit update destroy]

  # GET /follows
  def index
    @q = Follow.ransack(params[:q])
    @follows = @q.result(distinct: true).includes(:leader,
                                                  :user).page(params[:page]).per(10)
  end

  # GET /follows/1
  def show; end

  # GET /follows/new
  def new
    @follow = Follow.new
  end

  # GET /follows/1/edit
  def edit; end

  # POST /follows
  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      message = "Follow was successfully created."
      if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
        redirect_back fallback_location: request.referer, notice: message
      else
        redirect_to @follow, notice: message
      end
    else
      render :new
    end
  end

  # PATCH/PUT /follows/1
  def update
    if @follow.update(follow_params)
      redirect_to @follow, notice: "Follow was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /follows/1
  def destroy
    @follow.destroy
    message = "Follow was successfully deleted."
    if Rails.application.routes.recognize_path(request.referer)[:controller] != Rails.application.routes.recognize_path(request.path)[:controller]
      redirect_back fallback_location: request.referer, notice: message
    else
      redirect_to follows_url, notice: message
    end
  end

  private

  def current_user_must_be_follow_leader
    set_follow
    unless current_user == @follow.leader
      redirect_back fallback_location: root_path,
                    alert: "You are not authorized for that."
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_follow
    @follow = Follow.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def follow_params
    params.require(:follow).permit(:follower_id, :following_id)
  end
end
