class PaymentsController < ApplicationController
  before_action :set_payment, only: [:show, :update, :destroy]

  # GET /payments
  def index
    @payments = Payment.order(date: :desc)

    render json: @payments
  end

  def count_payments
    @ccount = Payment.all.count()
    render json: @ccount;
  end

  def calculate_payments
    date_start = params[:client][:date_start].to_datetime
    date_end = params[:client][:date_end].to_datetime
    drive = Drive.find(params[:client][:drive_id])
    @ccount = drive.payments.where('payments.created_at BETWEEN ? AND ?', date_start.beginning_of_day, date_end.end_of_day)
    render json: @ccount, status: :ok
  end


  # GET /payments/1
  def show
    render json: @payment
  end

  # POST /payments
  def create
    @payment = Payment.new(payment_params)
    unless @payment.bill_id.present?
      @payment.bill_id = Bill.where(source_hash: @payment.bill_hash).last.id
    end

    if @payment.save
      render json: @payment, status: :created, location: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /payments/1
  def update
    if @payment.update(payment_params)
      render json: @payment
    else
      render json: @payment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /payments/1
  def destroy
    @payment.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_payment
      @payment = Payment.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def payment_params
      params.require(:payment).permit(:value, :date, :bill_id, :source_hash, :bill_hash)
    end
end
