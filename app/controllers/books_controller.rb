class BooksController < ApplicationController
before_action :load_book, only: [:show,:edit,:update, :destroy]
   def new
    @book = Book.new
   end

  def index
    @books = Book.all
  end

  def show

  end

  def edit

  end

  def update
    if @book.update(book_params)
      flash[:success] = 'Book infos updated successfuly'
      redirect_to book_path(@book)
    else
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

      render :new
    end
  end


  private

  def load_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:name, :topic, :year)
  end

end
