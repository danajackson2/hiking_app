class TripsController < ApplicationController
    def show 
        @trip = Trip.find(params[:id])
    end
    
    def new 
        @trip = Trip.new
        @trails = Trail.all
        @hikers = Hiker.all
    end

    def create
        trip = Trip.create(params.require(:trip).permit(:date, :hiker_id, :trail_id))
        redirect_to trip
    end

    def edit
        @trip = Trip.find(params[:id])
    end

    def update
        trip = Trip.find(params[:id])
        trip.update(params.require(:trip).permit(:date, :hiker_id, :trail_id))
        redirect_to trip
    end

    def destroy
    end

end
