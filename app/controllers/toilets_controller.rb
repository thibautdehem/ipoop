class ToiletsController < ApplicationController
    skip_before_action :authenticate_user!, only: :index
    before_action :set_toilet, only: [:show, :edit, :update, :destroy]
    def index
      if params[:query].present?
        @toilets = policy_scope(Toilet.paginate(page: params[:page], per_page: 3)).where(style: params[:query])
      else
        @toilets = policy_scope(Toilet.paginate(page: params[:page], per_page: 3))
      end
        @markers = @toilets.map do |toilet|
          {
            lat: toilet.latitude,
            lng: toilet.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { toilet: toilet }),
            image_url: helpers.asset_url('logo.png')
          }
        end
      end

    def show
      @marker =
          {
            lat: @toilet.latitude,
            lng: @toilet.longitude,
            infoWindow: render_to_string(partial: "info_window", locals: { toilet: @toilet }),
            image_url: helpers.asset_url('logo.png')
          }
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
