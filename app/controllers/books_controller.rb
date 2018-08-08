class BooksController < ApplicationController
 before_action :set_book, only: [:edit, :show, :update, :destroy]
 before_action :authenticate_user!, except: [:show, :index]
  def index
   @books = Book.order(created_at: :DESC).page(params[:page]).per(30)
  end

  def create
   @book = Book.new(book_params)
   if @book.save
    redirect_to @book
   else 
    render :new
   end
  end

  def new
   @book = Book.new
  end

  def edit
   unless current_user === @book.user
    redirect_to @book
   end
  end

  def show
  end

  def update
   if @book.update(book_params)
    redirect_to @book
   else
    render :edit
   end
  end

  def destroy
   @book.destroy!
   redirect_to :index
  end
  
  private
  def set_book
   @book = Book.find(params[:id])
  end
  def book_params
   params.require(:book).permit(:title, :content, :user_id)
  end
end
