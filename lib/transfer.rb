require 'pry'

class Transfer
  
  attr_accessor :status, :sender, :receiver, :amount
  #attr_reader 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @sender.balance >= @amount
      return true
    else
      return false
    end
  end
  
  def execute_transaction
    if @status != "complete" && valid? == true
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
      return @status
    end
  end
  
end
