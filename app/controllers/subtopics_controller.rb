class SubtopicsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :correct_user, :except => [:index, :show]

  def new
    @topic = Topic.find(params[:topic_id])
    @subtopic = @topic.subtopics.new
  end

  def index
    @topic = Topic.find(params[:topic_id])
    @subtopics = @topic.subtopics.all
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @subtopic = @topic.subtopics.create(subtopic_params)
    if @subtopic.save
      flash[:success] = "Topic has been successfully created"
      redirect_to topic_path(@topic)
    else
      redirect_to "new"
    end

  end

  def show
    @subtopic = Subtopic.where(:id => params[:id]).first 
  end

  def edit
    @subtopic = Subtopic.where(:id => params[:id]).first 
  end

  def update
    @subtopic = Subtopic.where(:id => params[:id]).first 
    @subtopic.update_attributes(subtopic_params)
    if @subtopic.save
      flash[:success] = "Subtopic has been successfully updated"
      redirect_to subtopic_path(@subtopic)
    else
      render "edit"
    end
  end

  def destroy
    @subtopic = Subtopic.where(:id => params[:id]).first 
    @subtopic.destroy
    flash[:notice] = "Subopic deleted"
    redirect_to subtopics_path
  end
end

def subtopic_params
  params.require(:subtopic).permit(:title, :description, :lesson_number)
end

# def correct_user
#   @topic = Topic.where(:id => params[:topic_id])

# end

