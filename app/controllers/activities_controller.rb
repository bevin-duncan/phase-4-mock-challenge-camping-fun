class ActivitiesController < ApplicationController
    
    def index 
        render json: Activity.all
    end

    # def show
    #     activity = find_activity 
    #     render json: activity
    # end

    # def create
    #     activity = Activity.create!(activity_params)
    #     render json: activity, status: :created
    # end

    # def update
    #     activity = find_activity 
    #     actitvity.update!(activity_params)
    #     render json: activity, status: :created
    # end

    def destroy
        activity = find_activity 
        activity.destroy
        head :no_content, status: :gone
    end

    private

    def find_activity
        activity = Activity.find(params[:id])
    end

    def activity_params
        params.permit(:name, :difficulty)
    end

end
