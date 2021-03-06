class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActiveRecord::RecordNotDestroyed, with: :not_destroyed

  private
  def not_found(e)
    render json: { errors: e }, status: :not_found
  end 

  private
  def not_destroyed(e)
    render json: { errors: e }, status: :unprocessable_entity
  end
end
