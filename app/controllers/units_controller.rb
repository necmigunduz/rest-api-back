# app/controllers/units_controller.rb
class UnitsController < ApplicationController
    before_action :set_unit, only: [:show, :update, :destroy]
  
    # GET /units
    def index
      @units = Unit.all
      json_response(@units)
    end
  
    # POST /units
    def create
      @unit = Unit.create!(unit_params)
      json_response(@unit)
    end
  
    # GET /units/:id
    def show
      json_response(@unit)
    end
  
    # PUT /units/:id
    def update
      @unit.update(unit_params)
      head :no_content
    end
  
    # DELETE /units/:id
    def destroy
      @unit.destroy
      head :no_content
    end
  
    private
  
    def unit_params
      # whitelist params
      params.permit(:title)
    end
  
    def set_unit
      @unit = Unit.find(params[:id])
    end
  end