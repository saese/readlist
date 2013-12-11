class TopicsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]


  def index
    @topics = Topic.all
  end

  def new
    @user = current_user
    @topic = @user.topics.new

  end

  def create
    @user = current_user
    @topic = @user.topics.create(topic_params)
    if @topic.save
      flash[:success] = "Topic has been successfully created"
      redirect_to topic_path(@topic)
    else
      redirect_to "new"
    end
  end

  def show
    @topic = Topic.where(:id => params[:id]).first 
  end

  def edit
    @topic = current_user.topics.where(:id => params[:id]).first
    if @topic.nil?
      flash[:notice] = "You must be signed in to make changes"
      redirect_to topics_path
    end
  end

  def update
    @topic = current_user.topics.where(:id => params[:id]).first
    if @topic.nil?
      flash[:notice] = "You must be signed in to make changes"
      redirect_to topics_path
    else
      @topic.update_attributes(topic_params)
      if @topic.save
        flash[:success] = "Topic has been successfully updated"
        redirect_to topic_path(@topic)
      else
        render "edit"
      end
    end
  end

  def destroy
    @topic = current_user.topics.where(:id => params[:id]).first
    if @topic.nil?
      flash[:notice] = "You must be signed in to make changes"
      redirect_to topics_path
    else
      @topic.destroy
      flash[:notice] = "Topic deleted"
      redirect_to topics_path
    end
  end
end

def topic_params
  params.require(:topic).permit(:title, :description, :user)
end
