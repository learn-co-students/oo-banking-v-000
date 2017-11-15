require 'pry'

class Transfer
  
  attr_accessor :transfer, :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? 
  end
  
  def execute_transaction
      if sender.balance < amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      elsif valid? && @status == "pending"
        @status = "complete"     
        sender.balance = sender.balance - amount
        receiver.balance = receiver.balance + amount
      end     
  end

  def reverse_transfer
    if @status == "complete"
    @status = "reversed"
    sender.balance = sender.balance + amount
    receiver.balance = receiver.balance - amount 
    end
  end

end
