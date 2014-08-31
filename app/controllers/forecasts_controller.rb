class ForecastsController < ApplicationController
  before_action :set_forecast, only: [:show, :edit, :update, :destroy]

  # GET /forecasts
  # GET /forecasts.json
  def index
    @forecasts = Forecast.all
    @futures = Future.all

    # the mean
    sum = 0
    @forecasts.each do |i|
      @revenue = i.revenue
      sum += @revenue
    end
    @mean = sum / @forecasts.length

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

    @b1 = @total_xxbar_ttbar / @total_ttbar_sq
    @b0 = @mean - ( @b1 * @tbar )

    sum_sse = 0
    forecasts = Forecast.all
    forecasts.each do |i|
      sum_sse += i.x_xhatsq
    end
    @sse = sum_sse

    sum_ssr = 0
    forecasts = Forecast.all
    forecasts.each do |i|
      sum_ssr += i.xhat_xbarsq
    end
    @ssr = sum_ssr

    sum_sst = 0
    forecasts = Forecast.all
    forecasts.each do |i|
      sum_sst += i.x_xbarsq
    end
    @sst = sum_sst

    # Calculating the regression R^2

    @r2 = 1 - (@sse / @sst)







  end
  

  # GET /forecasts/1
  # GET /forecasts/1.json
  def show
  end

  # GET /forecasts/new
  def new
    @forecast = Forecast.new
  end

  # GET /forecasts/1/edit
  def edit
  end

  # POST /forecasts
  # POST /forecasts.json
  def create
    @forecast = Forecast.new(forecast_params)

    respond_to do |format|
      if @forecast.save
        format.html { redirect_to @forecast, notice: 'Forecast was successfully created.' }
        format.json { render :show, status: :created, location: @forecast }
      else
        format.html { render :new }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /forecasts/1
  # PATCH/PUT /forecasts/1.json
  def update
    respond_to do |format|
      if @forecast.update(forecast_params)
        format.html { redirect_to @forecast, notice: 'Forecast was successfully updated.' }
        format.json { render :show, status: :ok, location: @forecast }
      else
        format.html { render :edit }
        format.json { render json: @forecast.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /forecasts/1
  # DELETE /forecasts/1.json
  def destroy
    @forecast.destroy
    respond_to do |format|
      format.html { redirect_to forecasts_url, notice: 'Forecast was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_forecast
      @forecast = Forecast.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def forecast_params
      params.require(:forecast).permit(:year, :revenue)
    end
end
