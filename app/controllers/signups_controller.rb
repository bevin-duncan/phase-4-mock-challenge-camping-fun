class SignupsController < ApplicationController
   
    def index 
        render json: Signup.all
    end

    def show
        signup = find_signup 
        render json: signup
    end

    def create
        signup = Signup.create!(signup_params)
        render json: signup, status: :created
    end

    def update
        signup = find_signup 
        signup.update!(signup_params)
        render json: signup, status: :created
    end

    def destroy
        signup = find_signup 
        signup.destroy
        head :no_content, status: :gone
    end

    private

    def find_signup
        signup = Signup.find(params[:id])
    end

    def signup_params
        params.permit(:camper_id, :activity_id, :time)
    end
    

end