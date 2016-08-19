class AuthorsController < ApplicationController
  before_action :set_author, only: [:show, :edit, :update, :destroy]
  before_action :authorize_admin!, only: [:edit, :update, :destroy]

  def index
    @authors = Author.all
  end

  def new
    load_form_data
    @author = Author.new

  end

  def show

  end

  def create
    @author = Author.create(author_params)
    if @author.save
      redirect_to authors_path, notice: 'author has been saved'
    else
      load_form_data
      render :new
    end
  end

  def edit
    load_form_data
  end

  def update
    if @author.update(author_params)
      flash[:success] = 'Author infos updated successfuly'
      redirect_to authors_path(@author)
    else
      load_form_data
      render 'edit'
    end
  end

  def destroy
    @author.destroy
    flash[:warning] = 'Author infos deleted successfuly'
		redirect_to authors_path
  end

  private

    def author_params
      params.require(:author).permit(:name, :info, :publisher_id)
    end

    def set_author
      @author = Author.find(params[:id])
    end

    def authorize_admin!
      redirect_to root_path, notice: "Not authorized"
    end

    def load_form_data
      @publishers = Publisher.all.collect {|p| [p.name, p.id ] }
    end

end
