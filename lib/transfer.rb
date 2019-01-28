require 'pry'
class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status 
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender 
    @receiver = receiver 
    @amount = amount
    @status = status 
  end
  
  def valid?
    if @sender.valid? == true && @receiver.valid? == true 
      return true 
    else 
      return false
    end 
  end
  
  def execute_transaction
    if @sender.valid? == true && @status != "complete" && @sender.balance >= @amount  
      @amount = amount; 
      @receiver.deposit(amount);
      @sender.deposit(-amount);
      @status = "complete";
    else
      @status = "rejected";
      return "Transaction rejected. Please check your account balance."
    end 
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end 
  end 

end
