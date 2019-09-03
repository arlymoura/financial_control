class BillStatus < EnumerateIt::Base
  associate_values(
    :active,
    :paid
  )
end
