class DrivesController < ApplicationController
  before_action :set_drife, only: [:show, :update, :destroy]

  # GET /drives
  def index
    @drives = Drive.all

    render json: @drives, include: '**'
  end

  # GET /drives/1
  def show
    render json: @drife
  end

  # POST /drives
  def create
    @drife = Drive.new(drife_params)

    if @drife.save
      render json: @drife, status: :created, location: @drife
    else
      render json: @drife.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drives/1
  def update
    if @drife.update(drife_params)
      render json: @drife
    else
      render json: @drife.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drives/1
  def destroy
    @drife.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drife
      @drife = Drive.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def drife_params
      params.require(:drife).permit(:name)
    end
end
