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
    if @sender.valid? == true && @receiver.valid? == true 
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction
    if self.valid? == true && @status == "pending" && self.not_enough_funds == true 
      @sender.withdrawl(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 
  
  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.withdrawl(@amount)
      @status = "reversed"
    end 
  end 
  
  def not_enough_funds
    if @sender.your_balance < @amount 
      false 
    else
      true 
    end 
  end 
  
end
