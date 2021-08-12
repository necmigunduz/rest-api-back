# app/controllers/units_controller.rb
class UnitsController < ApplicationController
  skip_before_action :authorize_request, only: :index
  before_action :set_unit, only: [:show]

  # GET /units
  def index
    @units = Unit.all
    render json: { units: @units, status: :ok }
  end

  # POST /units
  # def create
  #   @unit = Unit.create!(unit_params)
  #   json_response(@unit)
  # end

  # GET /units/:id
  def show
    render json: { unit: @unit, measurements: @measurements }, status: :ok
  end

  # PUT /units/:id
  # def update
  #   @unit.update(unit_params)
  #   head :no_content
  # end

  # DELETE /units/:id
  # def destroy
  #   @unit.destroy
  #   head :no_content
  # end

  # private

  # def unit_params
  #   params.permit(:title)
  # end

  def set_unit
    @unit = Unit.find(params[:id])
  end
end
