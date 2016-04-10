require 'pry'
class Transfer
  # code here
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount =amount
    @status = "pending"
  end

  def both_valid?
     sender.valid? && receiver.valid?
  end

end
