class ComicsController < ApplicationController
    def index
        @comics = Comic.includes(:work).where(work_id: params[:work_id])
        @work = Work.find(params[:work_id])
        sequence = 1.step
    end

    def new
        @comic = Comic.new
        @work = Work.find(params[:work_id])
    end

    def create
        @comic = Comic.new(comic_params)
        @work = Work.find(params[:work_id])
        if @comic.save
            redirect_to work_comics_path(@work)
        else
            render "new"
        end
    end

    def show
        @comic = Comic.find(params[:id])
        images = @comic.images
    end

    private
    
    def comic_params
        params.require(:comic).permit(:subtitle, :explanation, {images: []}).merge(work_id: params[:work_id])
    end
end
