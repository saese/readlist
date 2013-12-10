class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.create(topic_params)
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
    @topic = Topic.where(:id => params[:id]).first 
  end

  def update
    @topic = Topic.where(:id => params[:id]).first
    @topic.update_attributes(topic_params)
    if @topic.save
      flash[:success] = "Topic has been successfully updated"
      redirect_to topic_path(@topic)
    else
      render "edit"
    end
  end

  def destroy
    @topic = Topic.where(:id => params[:id]).first
    @topic.destroy
    flash[:notice] = "Topic deleted"
    redirect_to topics_path
  end
end

def topic_params
  params.require(:topic).permit(:title, :description, :user)
end

