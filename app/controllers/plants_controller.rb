class PlantsController < ApplicationController

    def index
        render json: Plant.all, status: :ok 
    end

    def show
        plant = Plant.find_by(id:params[:id])
        if plant
            render json: plant, status: :ok
        else
            render json: {error: "Plant not found"}, status: :not_found
        end
    end

    def create
        # plant = Plant.create(plant_params)
        # if plant.valid?
        #     render json: plant, status: :created
        # else
        #     render json: {errors: plant.errors.full_messages}, status: :unprocessable_entity
        # end
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private

    def plant_params
        params.permit(:name, :image, :price)
    end

end
