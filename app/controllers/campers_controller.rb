class CampersController < ApplicationController


    def index 
        render json: Camper.all
    end

    def show
        camper = find_camper 
        render json: camper
    end

    def create
        camper = Camper.create!(camper_params)
        render json: camper, status: :created
    end

    def update
        camper = find_camper 
        camper.update!(camper_params)
        render json: camper, status: :created
    end

    def destroy
        camper = find_camper 
        camper.destroy
        head :no_content, status: :gone
    end

    private

    def find_camper
        camper = Camper.find(params[:id])
    end

    def camper_params
        params.permit(:name, :age)
    end

end
