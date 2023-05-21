class ComicsController < ApplicationController
    def index
        @comics = Comic.all
        @work = Work.find(params[:id])
    end
end
