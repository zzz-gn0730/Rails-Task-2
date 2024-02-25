class ErrorsController < ApplicationController
  def reservation_error
    render 'errors/reservation_error', status: :not_found
  end
end
