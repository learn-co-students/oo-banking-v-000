require 'pry'
class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @amount = amount
    @receiver = receiver
    @sender = sender
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? == true && @status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
  end
  if valid? == false
    @status = "rejected"
     "Transaction rejected. Please check your account balance."
  end
 end

  def reverse_transfer
    if status == "complete"
    @sender.balance = @sender.balance + @amount
    @receiver.balance = @receiver.balance - @amount
    @status = "reversed"
  end
 end

end
