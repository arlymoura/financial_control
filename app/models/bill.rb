class Bill < ApplicationRecord
  belongs_to :client
  has_many :payments, dependent: :destroy

  enum status: [:active, :paid]

end
