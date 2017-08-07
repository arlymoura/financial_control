class Client < ApplicationRecord
  has_many :bills
  belongs_to :drive, optional: true
end
