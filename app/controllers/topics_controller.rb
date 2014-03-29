class TopicsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]


  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:success] = "Topic has been successfully created"
      redirect_to topic_path(@topic)
    else
      render "new"
    end
  end

  def show
    @topic = Topic.where(:id => params[:id]).first 
  end

  def edit
    @topic = Topic.where(:id => params[:id]).first 
    unless (@topic and @topic.user_id == current_user.id)
      flash[:notice] = "You must be signed in to make changes"
      redirect_to topics_path
    end
  end

  def update
    @topic = Topic.where(:id => params[:id]).first 
    if @topic and @topic.user_id == current_user.id
      @topic.update_attributes(topic_params)
      if @topic.save
        flash[:success] = "Topic has been successfully updated"
        redirect_to topic_path(@topic)
      else
        render "edit"
      end
    else
      flash[:notice] = "You must be signed in to make changes"
      redirect_to topics_path
    end
  end

  def destroy
    @topic = Topic.where(:id => params[:id]).first 
    if @topic and @topic.id == current_user.id   
      @topic.destroy
      flash[:notice] = "Topic deleted"
      redirect_to topics_path
    else
      flash[:notice] = "You must be signed in to make changes"
      redirect_to topics_path

    end
  end

  private

end