require "pry"
class Transfer
  
  
  attr_accessor :sender, :receiver, :status, :amount
  
  
  def initialize(sender, receiver, amount = 50)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
   
  end 
  
  def valid?
    sender.valid? && receiver.valid?
  end 
  
  def execute_transaction
    if @status == "pending" && sender.valid? == true && sender.balance >= @amount
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end 
  
  def reverse_transfer
    if @status == "complete"
      x = sender.balance + @amount
      sender.balance = x
      y = receiver.balance - @amount
      receiver.balance = y
      @status = "reversed"
    end
  end 
end
