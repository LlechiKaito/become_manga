class InquiriesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new]
    
    def new
        @inquiry = Inquiry.new
    end

    def create
        @inquiry = Inquiry.new(inquiry_params)
        if @inquiry.save
            redirect_to user_path(current_user)
        else
            render 'new'
        end
    end

    private

    def inquiry_params
        params.require(:inquiry).permit(:inquiry).merge(user_id: current_user.id)
    end
end
