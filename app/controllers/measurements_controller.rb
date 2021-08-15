# app/controllers/measurements_controller.rb
class MeasurementsController < ApplicationController
  before_action :set_unit, except: [:index]
  before_action :set_unit_measurement, only: %i[show update destroy]

  def index
    @measurements = current_user.measurements.with_units.order(created_at: :desc)
    render json: { data: [@measurements], status: :ok }
  end

  def show
    json_response(@measurement)
  end

  def create
    @measurement = @unit.measurements.build(measurement_params)
    @measurement.unit_id = params[:unit_id]
    @measurement.user_id = current_user.id

    if @measurement.save
      render json: { measurement: @measurement }
    else
      render json: {error: 'Invalid submission'}
    end
  end

  def updated
    @measurement.update(measurement_params)
    head :no_content
  end

  def destroy
    @measurement.destroy
    head :no_content
  end

  private
  def measurement_params
    params.permit(:value, :unit_id, :user_id)
  end

  def set_unit
    @unit = Unit.find(params[:unit_id])
  end

  def set_unit_measurement
    @measurement = @unit.measurements.find_by!(id: params[:id]) if @unit
  end
end