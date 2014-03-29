class SubtopicsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :correct_user, :except => [:index, :show]

  def new
    @topic = Topic.find(params[:topic_id])
    @subtopic = Subtopic.new
  end

  def create
    @topic = Topic.find(params[:topic_id])
    if @topic.user_id == current_user.id
      @subtopic = Subtopic.create(subtopic_params)
      @subtopic.topic_id, @subtopic.user_id = @topic.id, current_user.id

      if @subtopic.save
        flash[:success] = "Topic has been successfully created"
        redirect_to topic_path(@topic)
      else
        redirect_to "new"
      end
    else
      redirect_to topics_path
    end
  end

  def index
    @topic = Topic.find(params[:topic_id])
    @subtopics = @topic.subtopics.order("position ASC")
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
    if @subtopic.user_id == current_user.id and @subtopic.save
      flash[:success] = "Subtopic has been successfully updated"
      redirect_to subtopic_path(@subtopic)
    else
      render "edit"
    end
  end

  def destroy
    @subtopic = Subtopic.where(:id => params[:id]).first 
    @subtopic.destroy if @subtopic.user_id == current_user.id
    flash[:notice] = "Subtopic deleted"
    redirect_to topic_path(@subtopic.topic)
  end

  def sort
    params[:subtopic].each_with_index do |id, index|
      Subtopic.update_all({position: index+1}, {id: id})
    end
    render nothing: true
  end

  private
    def subtopic_params
      params.require(:subtopic).permit(:title, :description, :lesson_number)
    end
end