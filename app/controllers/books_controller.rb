class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def create
    # //user = User.find(params[:id])
    # unless user.id == current_user.id
    # redirect_to books_path
    # end
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have created book successfully."
      redirect_to book_path(@book.id)
    else
      @user= current_user
      @books = Book.all
      render :index
    end
    # @book.title = nil
    # @book.body = nil
  end

  def show
    @book = Book.find(params[:id])
    @book_new = Book.new
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  def edit
    @book = Book.find(params[:id])
    unless @book.user == current_user
     @user = User.find(params[:id])
     redirect_to books_path
    end
  end

  def update
    # book = Book.find(params[:id])
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end
end
