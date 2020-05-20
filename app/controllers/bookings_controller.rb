class BookingsController < ApplicationController
 before_action :set_booking, only: [:show, :destroy]
 def index
        @bookings = Booking.all
    end

    def show
    end

    def new
        @toilet = Toilet.find(params[:toilet_id])
        @booking = Booking.new # needed to instantiate the form_for
        authorize @booking
    end

    def create
        @booking = Booking.new(booking_params)
        @toilet = Toilet.find(params[:toilet_id])
        authorize @booking
        @booking.toilet = @toilet
        if @booking.save   # if the Model has a validates: presence
            redirect_to toilet_path(@toilet)
          else
            render :new
          end
    end

    def destroy
        @booking.destroy
        redirect_to toilet_path(@toilet)
    end

    private

    def booking_params
      params.require(:booking).permit(:rating, :review, :arrivaltime, :pooptype)
    end

      def set_toilet
      @booking = Booking.find(params[:id])
      authorize @booking
    end
end
