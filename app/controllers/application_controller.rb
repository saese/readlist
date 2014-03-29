class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  before_filter :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :password_confirmation)}
  end

  def correct_user
	  if @topic
	    @topic = Topic.find(params[:topic_id]) 
	    current_user.id == @topic.user_id
	  end
	  if @subtopic
	    @subtopic = Subtopic.find(params[:subtopic_id]) 
	    current_user.id == @subtopic.user_id
	  end
  end
end

