class LinksController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :correct_user_edit, :except => [:index, :show, :new, :create]
  before_filter :correct_user_new, :only => [:new, :create]
  
  def new
    @subtopic = Subtopic.find(params[:subtopic_id])
    @link = @subtopic.links.new
  end

  def index
    @subtopic = Subtopic.find(params[:subtopic_id])
    @links = @subtopic.links.all
  end

  def create
    @subtopic = Subtopic.find(params[:subtopic_id])
    @link = @subtopic.links.create(link_params)
    if @link.save
      flash[:success] = "Link has been successfully created"
      redirect_to subtopic_path(@subtopic)
    else
      redirect_to "new"
    end

  end

  def show
    @link = Link.where(:id => params[:id]).first 
  end

  def edit
    @link = Link.where(:id => params[:id]).first 
  end

  def update
    @link = Link.where(:id => params[:id]).first 
    @link.update_attributes(link_params)
    if @link.save
      flash[:success] = "Link has been successfully updated"
      redirect_to subtopic_path(@link.subtopic)
    else
      render "edit"
    end
  end

  def destroy
    @link = Link.where(:id => params[:id]).first 
    @link.destroy
    flash[:notice] = "Link deleted"
    redirect_to subtopic_path(@link.subtopic)
  end
end

private
def link_params
  params.require(:link).permit(:title, :description, :hlink, :serial_number)
end

def correct_user_new
  @subtopic = Subtopic.where(:id => params[:subtopic_id]).first 
  raise "User not permitted" unless @subtopic.topic.user==current_user
end

def correct_user_edit
  @link = Link.where(:id => params[:id]).first 
  raise "User not permitted" unless @link.subtopic.topic.user == current_user
end
