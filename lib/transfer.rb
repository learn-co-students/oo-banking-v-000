require_relative 'bank_account'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @amount = amount 
    @status = "pending"
  end
  
  def valid?
    if sender.valid? && receiver.valid?
      true 
    else
      false 
    end
  end
  
  def execute_transaction
    if @sender.balance < @amount 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif @status == "complete"
      puts "This transaction has already been processed."
    else 
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end
  
  def reverse_transfer 
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end
end
