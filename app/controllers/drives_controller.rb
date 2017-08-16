class DrivesController < ApplicationController
  before_action :set_drive, only: [:show, :update, :destroy]

  # GET /drives
  def index
    @drives = Drive.order('name')

    # render json: @drives, include: '**'
    render json: @drives, each_serializer: ShortDriveSerializer, root: :drive
  end

  # GET /drives/1
  def show
    render json: @drive, serializer: DriveSerializer
  end

  # POST /drives
  def create
    @drive = Drive.new(drive_params)

    if @drive.save
      render json: @drive, status: :created, location: @drive
    else
      render json: @drive.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /drives/1
  def update
    if @drive.update(drive_params)
      render json: @drive
    else
      render json: @drive.errors, status: :unprocessable_entity
    end
  end

  # DELETE /drives/1
  def destroy
    @drive.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_drive
      @drive = Drive.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def drive_params
      params.require(:drive).permit(:name)
    end
end
