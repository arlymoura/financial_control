class Client < ApplicationRecord
  has_many :bills, dependent: :destroy 
  belongs_to :drive, optional: true
  validates :bills, :presence => false
  
end
