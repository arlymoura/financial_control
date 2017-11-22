class Drive < ApplicationRecord
  has_many :clients, dependent: :destroy

  def daily_collection(date = DateTime.now())
    sum = 0
    self.clients.each do |client|
      client.bills.each do |x|
        sum += x.payments.where("created_at >= :start_date AND created_at <= :end_date",
                                { start_date: date.beginning_of_day, end_date: date.end_of_day}).sum(&:value)
      end
    end
    sum
  end
end
