class BookingsController < ApplicationController
 before_action :set_booking, only: [:show, :destroy, :edit, :update]
    def index
        @bookings = policy_scope(Booking)
        #@toilet = Toilet.find(params[:toilet_id])
    end

    def show
        @booking = @toilet.bookings.new
    end

    def new
        @toilet = Toilet.find(params[:toilet_id])
        @booking = Booking.new # needed to instantiate the form_for
        authorize @booking
    end

    def create
        @booking = Booking.new(booking_params)
        @toilet = Toilet.find(params[:toilet_id])
        @booking.user = current_user
        authorize @booking
        @booking.toilet = @toilet
        if @booking.save!   # if the Model has a validates: presence
            redirect_to toilet_booking_path(@toilet, @booking)
          else
            render :new
          end
    end

    def show
    end

    def edit
    end

    def update
        @booking.update(booking_params)
        redirect_to toilets_path
    end

    def destroy
        @booking.destroy
        redirect_to bookings_path(@toilet)
    end

    private

    def booking_params
      params.require(:booking).permit(:arrivaltime, :pooptype, :review, :rating)
    end

    def set_booking
      @booking = Booking.find(params[:id])
      authorize @booking
    end
end
