class FuturesController < ApplicationController
  before_action :set_future, only: [:show, :edit, :update, :destroy]

  # GET /futures
  # GET /futures.json
  def index
    @futures = Future.all
  end

  # GET /futures/1
  # GET /futures/1.json
  def show
  end

  # GET /futures/new
  def new
    @future = Future.new
  end

  # GET /futures/1/edit
  def edit
  end

  # POST /futures
  # POST /futures.json
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

  # PATCH/PUT /futures/1
  # PATCH/PUT /futures/1.json
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

  # DELETE /futures/1
  # DELETE /futures/1.json
  def destroy
    @future.destroy
    respond_to do |format|
      format.html { redirect_to futures_url, notice: 'Future was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_future
      @future = Future.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def future_params
      params.require(:future).permit(:future_year)
    end
end
