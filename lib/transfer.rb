require 'pry'

class Transfer
  attr_accessor :status, :sender, :receiver, :amount
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
    if @sender.balance > @amount && @status == "pending"
      @receiver.balance = @receiver.balance + @amount
      @sender.balance = @sender.balance - @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
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
