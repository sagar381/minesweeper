class ApplicationController < ActionController::Base

  rescue_from ActiveRecord::RecordNotFound, with: :base_render_record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :base_render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotUnique, with: :base_render_record_not_unique

  private

  def base_render_record_not_found
    flash[:alert] = "Record Not Found"
    redirect_to root_path
  end

  def base_render_unprocessable_entity(exception)
    flash[:alert] = exception.message
    redirect_back_or_to '/', status: :unprocessable_entity
  end

  def base_render_record_not_unique
    flash[:alert] = "Record Not Unique"
    redirect_back_or_to '/', status: :forbidden
  end
end
