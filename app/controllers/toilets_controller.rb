class ToiletsController < ApplicationController
    skip_before_action :authenticate_user!
    def index
        @toilets = Toilet.all
    end
      
    def show
        @toilet = Toilet.find(params[:id])
    end

    def new
        @toilet = Toilet.new # needed to instantiate the form_for
    end

    def create
        @toilet = Toilet.new(restaurant_params)
        if @toilet.save   # if the Model has a validates: presence
            redirect_to toilets_path
          else
            render :new
          end
    end
    
    def edit
        @toilet = Toilet.find(params[:id])
    end
    
    def update
        @toilet = Toilet.find(params[:id])
        @toilet.update(toilet_params)
        # Will raise ActiveModel::ForbiddenAttributesError
        redirect_to toilets_path
    end

    def destroy
        @toilet = Toilet.find(params[:id])
        @toilet.destroy
        redirect_to toilets_path
    end

    private

    def restaurant_params
      params.require(:toilet).permit(:address, :style, :description)
    end
end
