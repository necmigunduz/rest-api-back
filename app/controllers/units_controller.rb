# app/controllers/units_controller.rb
class UnitsController < ApplicationController
  skip_before_action :authorize_request, only: :index
  before_action :set_unit, only: [:show]

  def index
    @units = Unit.all
    render json: { units: @units, status: :ok }
  end

  def show
    @unit = Unit.find(params[:id])
    @measurements = @unit.measurements.with_user(current_user.id)
    render json: { unit: @unit, measurements: @measurements }, status: :ok
  end

  def set_unit
    @unit = Unit.find(params[:id])
  end
end
