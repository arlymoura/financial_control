class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :update, :destroy]

  # GET /clients
  def index
    @clients = Client.order(:name)

    # render json: @clients, include: 'bills', fields: { payments: ['value', 'date', 'created_at'] }
    render json: @clients, include: '**'
    # render json: @clients, each_serializer: ShortClientSerializer, root: :client
  end

  def count_clients
    @ccount = Client.all.count()
    render json: @ccount;
  end

  # GET /clients/1
  def show
    render json: @client, serializer: ClientSerializer
  end

  # POST /clients
  def create
      puts params.inspect
    @client = Client.new(client_params)
    if @client.save!
      render json: @client, status: :created, location: @client
    else
      render json: @client.errors, status: :created
    end
  end

  # PATCH/PUT /clients/1
  def update
    if @client.update(client_params)
      render json: @client
    else
      render json: @client.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clients/1
  def destroy
    @client.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def client_params
      params.require(:client).permit(:name, :cpf, :rg, :phone1, :phone2, :street, :number, :district, :city, :drive_id, :source_hash)
    end
end
