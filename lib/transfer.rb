
class Transfer
  # your code here

attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = pending
    @amount = amount
  end


end
