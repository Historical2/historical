class BooksController < ApplicationController
 # before_action :set_book, only: [:edit, :show, :update, :destroy]
 # before_action :authenticate_user!, except: [:show, :index]
  def index
  end

  def create
  end

  def new
   @book = Book.new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
  
  private
  def set_book
   @book = Book.find(params[:id])
  end
end
