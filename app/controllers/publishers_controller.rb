class PublishersController < ApplicationController

  def index
    @publishers = Publisher.all
  end

  def show
    @publisher = Publisher.find(params[:id])
  end

  def edit
    @publisher = Publisher.find(params[:id])
  end

  
end
