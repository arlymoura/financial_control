class Drive < ApplicationRecord
  has_many :clients, dependent: :destroy
end
