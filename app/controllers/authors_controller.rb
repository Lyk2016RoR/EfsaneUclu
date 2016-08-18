class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    @author = Author.new
  end

  def show

  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to authors_path, notice: 'author has been saved'
    else
      load_author
      render :new
    end
  end

  def edit
    load_author
  end

  def update

  end

  def destroy

  end

  private

    def load_author
      @author = Author.find(params[:id])
    end

    def author_params
      params.require(:author).permit(:name, :info)
    end

    def set_author
      @author = Author.find(params[:id])
    end

end
