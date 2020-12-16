class HikersController < ApplicationController
    def index
        @hikers = Hiker.all
    end

    def show
        @hiker = Hiker.find(params[:id])
    end

    def new
        @hiker = Hiker.new
    end

    def create
        hiker = Hiker.create(params.require(:hiker).permit(:name))
        redirect_to hiker
    end

    def edit
        @hiker = Hiker.find(params[:id])
    end

    def update
        hiker = Hiker.find(params[:id])
        hiker.update(params.require(:hiker).permit(:name))
        redirect_to hiker
    end

    def destroy
    end
end
