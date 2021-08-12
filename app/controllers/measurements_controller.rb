# app/controllers/measurements_controller.rb
class MeasurementsController < ApplicationController
  before_action :set_unit, except: %i[index show]
  before_action :set_unit_measurement, only: %i[show update destroy]

  # GET /measurements
  def index
    @measurements = current_user.measurements.with_units
    # data = Hash.new { |h, k| h[k] = [] }
    # @measurements.each do |m|
    #   data[m.unit.title] << m
    # end
    render json: { data: @measurements, status: :ok }
  end
  # GET /units/:unit_id/measurements/:id
  # def show
  #   json_response(@measurement)
  # end

  # POST /units/:unit_id/measurements
  # def create
  #   @measurement = @unit.measurements.create!(measurement_params)
  #   json_response(@measurement)
  # end

  def create
    @measurement = current_user.measurements.build(measurement_params)
    # @measurement.unit_id = params[:unit_id]
    if @measurement.save
      render json: { measurement: @measurement }
    else
      render json: { error: 'Invalid submission' }
    end
  end

  # PUT /units/:unit_id/measurements/:id
  def update
    @measurement.update(measurement_params)
    head :no_content
  end

  # DELETE /units/:unit_id/measurements/:id
  def destroy
    @measurement.destroy
    head :no_content
  end

  private

  def measurement_params
    params.permit(:value, :unit_id)
  end

  def set_unit
    @unit = Unit.find(params[:unit_id])
  end

  def set_unit_measurement
    @measurement = @unit.measurements.find_by!(id: params[:id]) if @unit
  end
end
