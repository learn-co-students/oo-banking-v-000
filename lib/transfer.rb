require "pry"

class Transfer
  attr_accessor :receiver , :sender , :amount, :status

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if valid? == true && sender.balance > amount && @status != "complete"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end

  def reverse_transfer
    if  valid? != true
    "Transaction rejected. Please check your account balance."
  elsif @status == "complete"
    receiver.balance -= @amount
    sender.balance += @amount
    @status = "reversed"
  end
end

end
