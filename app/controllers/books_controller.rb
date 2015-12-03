class BooksController < ApplicationController

  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    if @book.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show

  end

  def index
    @books = Book.order("created_at DESC")
  end

  def edit


  end

  def update

    if @book.update book_params
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @book.destroy
      redirect_to root_path
    else
      render @book
    end
  end


  private

  def find_book
    @book = Book.find params[:id]
  end

  def book_params
    params.require(:book).permit(:title, :body, :author, :image)
  end

end
