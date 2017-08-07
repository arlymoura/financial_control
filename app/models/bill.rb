class Bill < ApplicationRecord
  belongs_to :client
  has_many :payments

  enum status: [:active, :paid]

end
