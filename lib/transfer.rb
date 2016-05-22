require 'pry'

class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender != nil && @receiver != nil &&
    @sender.valid? && @receiver.valid? &&
    @sender.balance > @amount &&
    @status == "pending"
  end
  
  def execute_transaction
    if valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      rejection = "Transaction rejected. Please check your account balance."
      rejection
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
  
end
