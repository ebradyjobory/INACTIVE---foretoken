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

    respond_to do |format|
      if @future.save
        format.html { redirect_to @future, notice: 'Future was successfully created.' }
        format.json { render :show, status: :created, location: @future }
      else
        format.html { render :new }
        format.json { render json: @future.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @future.update(future_params)
        format.html { redirect_to @future, notice: 'Future was successfully updated.' }
        format.json { render :show, status: :ok, location: @future }
      else
        format.html { render :edit }
        format.json { render json: @future.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @future.destroy
    respond_to do |format|
      format.html { redirect_to futures_url, notice: 'Future was successfully destroyed.' }
      format.json { head :no_content }
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
