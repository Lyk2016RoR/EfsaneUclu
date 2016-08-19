class BooksController < ApplicationController

    before_action :authenticate_user!, except: [:show, :index]
    before_action :load_book, only: [:show, :update, :edit, :destroy]
    before_action :authorize_user!, only: [:edit, :update, :destroy]

    before_action :load_book, only: [:show,:edit,:update, :destroy]





   def new
     load_form_data
    @book = Book.new
   end

  def index
    @books = Book.all
  end

  def show
    if current_user
      if @book.votes.where(user_id: current_user.id).any?
        @vote = @book.votes.where(user_id: current_user.id).first
      else
        @vote = @book.votes.build
      end
    end
  end



  def edit
    load_form_data
  end

  def update
    if @book.update(book_params)
      flash[:success] = 'Book infos updated successfuly'
      redirect_to book_path(@book)
    else
      load_form_data
      render :edit
   end
  end

  def destroy
    @book.destroy
  		flash[:warning] = 'Book infos deleted successfuly'
  		redirect_to books_path
  end

  def create
    @book = Book.create(book_params)
    if @book.save
      redirect_to books_path, notice: 'Book has been saved'
    else
      load_form_data
      render :new
    end
  end


  private

  def load_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :topic, :year, :category_id, author_ids: [])
  end

  def load_form_data
    @categories = Category.all.collect {|c| [c.name, c.id ] }
    @authors = Author.all
  end

  def authorize_user!
    redirect_to root_path, notice: "Not authorized" unless @book.user_id == current_user.id
  end

end
