require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    return reject_transfer if sender.balance < @amount
    if both_valid? == true && @status == "pending" 
      receiver.deposit(@amount)
      sender.balance -= @amount
      @status = "complete"
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(@amount)
      receiver.balance -= @amount
      @status = "reversed"
    end
  end


end