class Bill < ApplicationRecord
  before_create :set_default_status

  belongs_to :client
  has_many :payments, dependent: :destroy

  has_enumeration_for :status, with: BillStatus, create_helpers: true

  def set_default_role
    self.status ||= 'active'
  end
end
