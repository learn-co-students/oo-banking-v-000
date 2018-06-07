require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end
  
  def sender 
    @sender
  end
  
  def receiver
    @receiver
  end
  
  def amount
    @amount
  end
  
  def status
    @status
  end
  
  def valid?
    @sender.valid? && @receiver.valid? 
  end
  
  def execute_transaction
      if @sender.balance > @amount && @status == "pending"
        @sender.balance = @sender.balance - @amount
        @receiver.balance = @receiver.balance + @amount
        @status = "complete"
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
       
      end
  end
  
  def reverse_transfer
    if @status == "complete"
      @receiver.balance = @receiver.balance - @amount
        @sender.balance = @sender.balance + @amount
        @status = "reversed"
    end
  end 
  
end
