# app/controllers/measurements_controller.rb
class MeasurementsController < ApplicationController
    before_action :set_unit
    before_action :set_unit_measurement, only: [:show, :update, :destroy]
  
    # GET /units/:unit_id/measurements
    def index
      json_response(@unit.measurements)
    end
  
    # GET /units/:unit_id/measurements/:id
    def show
      json_response(@measurement)
    end
  
    # POST /units/:unit_id/measurements
    def create
      @unit.measurements.create!(measurement_params)
      json_response(@unit)
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
      params.permit(:value, :unit_id, :user_id)
    end
  
    def set_unit
      @unit = Unit.find(params[:unit_id])
    end
  
    def set_unit_measurement
      @measurement = @unit.measurements.find_by!(id: params[:id]) if @unit
    end
  end