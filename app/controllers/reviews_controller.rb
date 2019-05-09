class ReviewsController < ApplicationController
    def index
        @review = Review.find(@comic.id).order(created_at: :desc)
    end
    def new
        @review = Review.new
        redirect_to("/comics/#{@comics.id}")
    end
    def create
    end

end
