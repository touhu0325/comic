class CommentsController < ApplicationController
  def index
    @comments = Comment.find(@comic.id).order(created_at: :desc)
  end
  def new
      @comments = Comment.new
      redirect_to("/comics/#{@comics.id}")
  end
  def create
      @comic = Comic.find_by(id: params[:id])
      @comments = Comment.new(review_params)
      @comments.comic_id = @comic.id
      if @comment.save
        redirect_to("/comics/#{@comic.id}")
      else
        redirect_to("/comics/#{@comic.id}")
      end
  end

  private
  def review_params
    params.require(:comments).permit(:name, :content, :comic_id ,:user_id)
  end
end
