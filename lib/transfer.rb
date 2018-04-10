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
    sender.valid? == receiver.valid?
  end

  def execute_transaction
#    if sender.valid? == false || receiver.valid? == false
    #  "Transaction rejected. Please check your account balance."
    if  valid? != true
    "Transaction rejected. Please check your account balance."
  else
    sender.balance -= @amount
    receiver.balance += @amount
    @status = "complete"
  end
  if sender.balance > 1000
    execute_transaction
  else
    "Transaction rejected. Please check your account balance."
    sender.status = "Transaction rejected. Please check your account balance."
    break  
  end
end

  def reverse_transfer
end

end
