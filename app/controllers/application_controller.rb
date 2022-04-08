class ApplicationController < ActionController::API
  include ActionController::Cookies

rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable


def render_not_found(invalid)
  render json: {errors: "#{model} not found:", status: :not_found}
end

def render_unprocessable(invalid) 
      render json: {errors: "validation errors"}, status: :unprocessable_entity
end 
end
