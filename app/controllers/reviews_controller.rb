class ReviewsController < ApplicationController
    def index
        @review = Review.find(@comic.id).order(created_at: :desc)
    end
    def new
        @review = Review.new
        redirect_to("/comics/#{@comics.id}")
    end
    def create
        @comic = Comic.find_by(id: params[:comic_id])
             @review = Review.new(review_params)
            @review.comic_id = @comic.id
            if @review.save
              redirect_to("/comics/#{@comic.id}")
              else
                redirect_to("/comics/#{@comic.id}")
              end
    end

    private
    def review_params
      params.require(:review).permit(:name, :content, :comic_id)
    end

end
