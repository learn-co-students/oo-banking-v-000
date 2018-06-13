require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    (self.receiver.valid? && self.sender.valid?) ? true : false
  end

  def execute_transaction
    if self.valid? && @status == "pending" && @amount <= @sender.balance
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.balance += @amount
      @amount = 0
      @status = "reversed"
  else
    "Transaction rejected."
  end
end

end
