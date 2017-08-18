class BillSerializer < ActiveModel::Serializer

  attributes :id, :value, :note, :status, :date, :paid, :quant, :end_date, :client_id, :total_payments

  has_many :payments

  def paid
    object.payments.map(&:value).sum
  end

  def total_payments
   (object.quant = 0) if object.quant.blank?
   obj = "#{object.payments.count}/#{object.quant}"
  end

  def status
    return (object.status = 'paid') if paid() >= object.value
    object.status
  end

  def payments
    object.payments.order(date: :desc)
  end

  def attributes(*args)
    obj = super(*args)
    # obj[:created_at] = (I18n.l(object.created_at) unless object.created_at.blank?)
    obj[:created_at] = object.created_at.strftime("%d/%m/%Y")
    obj[:date] = object.date.strftime("%d/%m/%Y") if object.date.present?
    obj[:end_date] = object.end_date.strftime("%d/%m/%Y") if object.end_date.present?
    obj
  end
end
