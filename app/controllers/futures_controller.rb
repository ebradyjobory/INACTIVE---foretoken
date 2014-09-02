class FuturesController < ApplicationController
  before_action :set_future, only: [:show, :edit, :update, :destroy]


  def index
    @futures = Future.all

    @forecasts = Forecast.all
    @last_data = @forecasts.last
    @last_id =  @last_data.id
  end

  def show
  end

  def new
    @future = Future.new
  end

  def edit
  end

  def create
    @future = Future.new(future_params)
      if @future.save
        flash[:notice] = "Data was created successfully"
        redirect_to(:controller => 'forecasts', :action => 'index')  
      else
        render('edit')
    end
  end


  def update
      if @future.update(future_params)
        flash[:notice] = 'Data was successfully updated.' 
        redirect_to(:controller => 'forecasts', :action => 'index')
      else
        render('edit')
      end
  end


  def destroy
    if @future.destroy
    flash[:notice] =  'Data was successfully destroyed.'
    redirect_to(:controller => 'forecasts', :action => 'index')
    end
  end

  private

    def set_future
      @future = Future.find(params[:id])
    end

    def future_params
      params.require(:future).permit(:future_year)
    end
end
