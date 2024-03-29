class ForecastsController < ApplicationController

  before_action :find_project
  before_action :set_forecast, only: [:show, :edit, :update, :destroy]
  

  def index

   @forecasts = @project.forecasts
   @futures = Future.all

   if !@forecasts.empty?
   # calculating the mean of revenues
   sum = 0
   @forecasts.each do |i|
   @revenue = i.revenue
   sum += @revenue
   end
   @mean = sum / @forecasts.length # mean

   total_ttbarsq = 0
   total_xxbar_ttbar = 0
   @forecasts.each do |k|
   total_ttbarsq += k.ttbar_sq
   total_xxbar_ttbar += k.xxbar_ttbar
   end
   @total_ttbar_sq = total_ttbarsq
   @total_xxbar_ttbar = total_xxbar_ttbar

   sum = 0
   ids = []
   total_tbar = 0
   @forecasts.each do |i|
   ids << i.id
   end
   ids.each do |k|
   sum += k
   end
   @tbar = sum / ids.length

   # b1 and b0 values
   @b1 = @total_xxbar_ttbar / @total_ttbar_sq
   @b0 = @mean - ( @b1 * @tbar )

   sum_sse = 0
   forecasts = Forecast.all
   forecasts.each do |i|
   sum_sse += i.x_xhatsq
   end
   @sse = sum_sse # SSE

   sum_ssr = 0
   forecasts = Forecast.all
   forecasts.each do |i|
   sum_ssr += i.xhat_xbarsq
   end
   @ssr = sum_ssr # SSR

   sum_sst = 0
   forecasts = Forecast.all
   forecasts.each do |i|
   sum_sst += i.x_xbarsq
   end
   @sst = sum_sst # SST

   # Calculating R^2 ( R^2 = 1 - (SSE / SST))
   @r2 = 1 - (@sse / @sst)
   # @current_project = Project.find(params[:id])
   # @current_forecasts = @current_project.forecasts
     end
  end

  

  def show
  end

  def new
    @forecast = Forecast.new(:project_id => @project.id)
  end

  def edit
  end


  def create
     @forecast = Forecast.new(forecast_params)
      if @forecast.save
        # @current_project = Project.find(6)
        # @current_project.forecasts << @forecast
        flash[:notice] = "Data was created successfully"
        redirect_to('index', :project_id => @project.id)
      else
        render('new')
      end
  end

  def update
      if @forecast.update(forecast_params)
        flash[:notice] = "Data was updated successfully"
        redirect_to(:action => 'index', :project_id => @project.id)
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

    def set_forecast
      @forecast = Forecast.where(:project_id => @project.id)
    end

    def forecast_params
      params.require(:forecast).permit(:year, :revenue)
    end

    def find_project
      if params[:project_id]
        @project = Project.find(params[:project_id])
      end  
    end
end
