class ToiletsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :set_toilet, only: [:show, :edit, :update, :destroy]
    def index
        @toilets = Toilet.all
        @toilets = policy_scope(Toilet)
        @toiletsgeo = Toilet.geocoded # returns toilets with coordinates
        @markers = @toiletsgeo.map do |toilet|
          {
            lat: toilet.latitude,
            lng: toilet.longitude
          }
          end
    end

    def show
    end

    def new
        @toilet = Toilet.new # needed to instantiate the form_for
        authorize @toilet
    end

    def create
      @toilet = Toilet.new(toilet_params)
      @toilet.user = current_user
      authorize @toilet
          if @toilet.save   # if the Model has a validates: presence
            redirect_to toilets_path
          else
            render :new
          end
      end

    def edit
    end

    def update
        @toilet.update(toilet_params)
        # Will raise ActiveModel::ForbiddenAttributesError
        redirect_to toilets_path
    end

    def destroy
        @toilet.destroy
        redirect_to toilets_path
    end

    private

    def toilet_params
      params.require(:toilet).permit(:address, :style, :description, :photo)
    end

    def set_toilet
      @toilet = Toilet.find(params[:id])
      authorize @toilet
    end
end
