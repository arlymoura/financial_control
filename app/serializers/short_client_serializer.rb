class ShortClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf, :genre

  def cpf
    CPF.new(object.cpf).formatted
  end

end
