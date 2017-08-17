class BillSerializer < ActiveModel::Serializer

  attributes :id, :value, :note, :status, :date, :paid, :client_id

  has_many :payments

  def paid
    paid = 0.0
    object.payments.each do |payment|
      paid += payment.value
    end
  paid
  end

  def payments
    object.payments.order(date: :desc)
  end

  def attributes(*args)
    obj = super(*args)
    # obj[:created_at] = (I18n.l(object.created_at) unless object.created_at.blank?)
    obj[:created_at] = object.created_at.strftime("%d/%m/%Y")
    obj[:date] = object.date.strftime("%d/%m/%Y")
    obj
  end
end
