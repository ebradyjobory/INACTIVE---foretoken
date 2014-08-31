class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

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
  

end
