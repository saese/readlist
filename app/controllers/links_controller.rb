class LinksController < ApplicationController
  def index
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end

def link_params
  params.require(:link).permit(:title, :description, :hlink, :serial_number)
end