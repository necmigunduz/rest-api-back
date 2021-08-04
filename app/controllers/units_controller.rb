# app/controllers/units_controller.rb
class UnitsController < ApplicationController
    before_action :set_unit, only: [:show]
  
    # GET /units
    def index
      @units = Unit.all
      json_response(@units)
    end
  
    # GET /units/:id
    def show
      json_response(@unit)
    end
  
    private
  
    def set_unit
      @unit = Unit.find(params[:id])
    end
  end