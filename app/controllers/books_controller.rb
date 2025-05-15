class BooksController < ApplicationController
  def top #トップページapp/views/books/top.html.erb
  end

  def index #投稿フォームと投稿一覧の表示app/views/books/index.html.erb
    @book = Book.new        # 新規投稿用
    @books = Book.all.order(:id)  # 一覧表示（IDの昇順）
  end

  def create #新しい投稿の保存
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."  # 成功メッセージ
      redirect_to book_path(@book)
    else
      @books = Book.all
      render :index
    end

    def destroy
      @book = Book.find(params[:id])
      @book.destroy
      flash[:notice] = "Book was successfully destroyed."
      redirect_to books_path
    end
  end

  def show #詳細表示ページapp/views/books/show.html.erb
    @book = Book.find(params[:id])
  end

  def edit #編集フォームの表示app/views/books/edit.html.
    @book = Book.find(params[:id])
  end

  def update #本の情報を編集保存
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book)
    else
      flash.now[:alert] = "Failed to update book."  # ← エラーメッセージを表示
      render :edit #フォームを保持したままeditページを再表示
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end