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

end
