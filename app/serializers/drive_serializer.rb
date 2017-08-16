class DriveSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :clients

  def clients
    object.clients.order('name')
  end
end
