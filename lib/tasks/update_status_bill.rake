namespace :update do
  desc "UPDATE" 
  task bills_status: :environment do
    Bill.all.each do |b|
      b.value == b.payments.sum(:value) ? b.update(status: :paid) : b.update(status: :active)
    end
  end
end