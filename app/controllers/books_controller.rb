class BooksController < ApplicationController
before_action :load_book, only: [:show,:edit,:update, :destroy]
   def new
     load_form_data
    @book = Book.new
   end

  def index
    @books = Book.all
  end

  def show

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
    params.require(:book).permit(:name, :topic, :year, :category_id)
  end

  def load_form_data
    @categories = Category.all.collect {|c| [c.name, c.id ] }
  end

end
