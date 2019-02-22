class ClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :rg, :phone1, :phone2,
    :street, :number, :district, :city, :created_at, :source_hash, :last_bill_payments

  has_many :bills

  def bills
    object.bills.order(date: :desc)
  end

  def last_bill_payments
    object.bills.last.payments if object.bills.present?
  end



  def attributes(*args)
    obj = super(*args)
    # obj[:created_at] = (I18n.l(object.created_at) unless object.created_at.blank?)
    obj[:created_at] = object.created_at.strftime("%d/%m/%Y")
    obj[:cpf] = CPF.new(object.cpf).formatted
    obj
  end
end
