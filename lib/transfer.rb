require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount
    
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    @sender.valid? && @receiver.valid?
  end
  
  def execute_transaction
    if @status == "pending" && @sender.balance > amount && valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete" && @receiver.balance > amount && valid?
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end








