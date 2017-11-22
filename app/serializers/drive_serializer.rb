class DriveSerializer < ActiveModel::Serializer
  attributes :id, :name, :daily_collection, :date
  has_many :clients

  def clients
    object.clients.order('name')
  end

  def daily_collection
    object.daily_collection
  end

  def date
    object = DateTime.now().strftime("%d/%m/%Y")
  end
end
