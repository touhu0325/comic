class ComicsController < ApplicationController
    def index
        @comic = Comic.all.order(created_at: :desc)
        @publisher = Publisher.all
    end

    def jump
      @jump = Publisher.find(1).comic
      @comic = Comic.find_by(id: params[:id])
    end
    
    def show
        @comic = Comic.find_by(id: params[:id])
        @comments = @comic.reviews
        @comment = Comment.new
    end

    def new
        @comic = Comic.new
    end

    def create
      if params[:image]
        @comic.image_name = "#{@comic.id}.jpg"
        image = params[:image]
        File.binwrite("public/comic_image/#{@comic.image_name}", image.read)
      end
        @comic = Comic.new(comic_params)
        if @comic.save
        redirect_to("/")
        else
        render :new
        end
    end

    def edit
      if params[:image]
        @comic.image_name = "#{@comic.id}.jpg"
        image = params[:image]
        File.binwrite("public/comic_image/#{@comic.image_name}", image.read)
        @comic.save
     end
        @comic = Comic.find_by(id: params[:id])
    end
    def update
        @comic = Comic.find_by(id: params[:id])
        if params[:image]
          @comic.image_name = "#{@comic.id}.jpg"
          image = params[:image]
          File.binwrite("public/comic_image/#{@comic.image_name}", image.read)
          @comic.save
      end
        @comic.update(comic_params)
        if @comic.save
            flash[:notice] = "保存完了"
            redirect_to comic_path(@comic)
        else 
            flash[:notice] = "保存失敗"
            render :edit
        end
    end
    def destroy
        @comic = Comic.find_by(id: params[:id])
        @comic.destroy
        flash[notice] = "削除"
        redirect_to("/")
    end

    def comment
      post_text = params[:data][:text]
      results = { :message => post_text }
      render partial: 'comment_partial', locals: { :results => results }
    end

    private
    def comic_params
      params.require(:comic).permit(:title, :price, :publisher_id, :content)
    end

end
