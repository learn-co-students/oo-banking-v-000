require 'pry'
class Transfer
  attr_accessor :bankaccount, :sender, :receiver, :amount, :status
  def initialize(sender,receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount 
    @status = "pending"
  end 
  
  def valid?
    if sender.valid? == true && receiver.valid? == true && sender.balance >= @amount
      true 
    else 
      false 
    end 
  end 
  
  def execute_transaction 
    if @status == "pending"
      if self.valid? 
        @status = "complete"
        sender.balance -= @amount
        receiver.balance  += @amount
      else 
         @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end 
    end 
  end 
  
  def reverse_transfer
      if @status == "complete"
        sender.balance += @amount
        receiver.balance  -= @amount
        @status = "reversed"
      end 
  end 





end
