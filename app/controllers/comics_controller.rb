class ComicsController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
    before_action :comic_judge, only: [:edit, :update, :destroy]

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
        @comic = Comic.find(params[:id])
        # # unlessは、ifの逆です。見つからなかったら実行、つまり一人１カウントって意味です。
        # unless ReadCount.find_by(user_id: current_user.id, comic_id: @comic.id)
        #     current_user.read_counts.create(comic_id: @comic.id)
        # end
        # 60秒経ったら１カウント
    end

    def edit
    end
    
    def update
        if @comic.update(comic_params)
            redirect_to  work_comics_path(@work, @comic)
        else
            render 'edit'
        end
    end
    
    def destroy
        @comic.destroy
        redirect_back(fallback_location: root_path)
    end

    private

    def comic_judge
        if Work.find(params[:work_id]).user[:id] == current_user[:id]
            @comic = Comic.find(params[:id])
            @work = Work.find(params[:work_id])
        else
            redirect_to root_path
        end
    end
    
    def comic_params
        params.require(:comic).permit(:subtitle, :explanation, {images: []}).merge(work_id: params[:work_id])
    end
end
