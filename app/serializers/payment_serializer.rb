class PaymentSerializer < ActiveModel::Serializer
  attributes :id, :value, :date, :amount, :debit


  def amount
    object.bill.value
  end

  def paid
    object.bill.payments.map(&:value).sum
  end

  def debit
    object.bill.value - paid()
  end


  def attributes(*args)
    obj = super(*args)
    # obj[:created_at] = (I18n.l(object.created_at) unless object.created_at.blank?)
    obj[:created_at] = object.created_at.strftime("%d/%m/%Y")
    obj[:date] = object.date.strftime("%d/%m/%Y") if object.date.present?
    obj
  end
end
