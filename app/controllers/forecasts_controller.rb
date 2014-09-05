class ForecastsController < ApplicationController

  before_action :set_forecast, only: [:show, :edit, :update, :destroy]
  before_action :check_data, only: [:index]

  def index
    @current_project = Project.find(params[:id])
    @current_forecasts = @current_project.forecasts
  end
  

  def show
  end

  def new
    @forecast = Forecast.new
  end

  def edit
  end


  def create
    @forecast = Forecast.new(forecast_params)
      if @forecast.save
        flash[:notice] = "Data was created successfully"
        redirect_to(:action => 'index')
      else
        render('new')
      end
  end

  def update
      if @forecast.update(forecast_params)
        flash[:notice] = "Data was updated successfully"
        redirect_to(:action => 'index')
      else
        render('update')
      end
  end

  def destroy
    @forecast.destroy
    respond_to do |format|
      format.html { redirect_to forecasts_url, notice: 'Forecast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def check_data
      @forecasts =  Forecast.all
      if @forecasts.empty?
        redirect_to(:action => 'new')
      end
      
    end

    def set_forecast
      @forecast = Forecast.find(params[:id])
    end

    def forecast_params
      params.require(:forecast).permit(:year, :revenue)
    end
end
