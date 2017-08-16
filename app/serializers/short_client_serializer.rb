class ShortClientSerializer < ActiveModel::Serializer
  attributes :id, :name, :cpf

  def cpf
    CPF.new(object.cpf).formatted
  end

end
