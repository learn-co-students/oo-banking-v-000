require 'pry'

class Transfer
  attr_accessor :balance, :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    if (sender.valid? && receiver.valid?)
      true
    else
      false
    end
  end

  def execute_transaction
    #binding.pry
    if both_valid? && sender.balance > amount && @status == "pending"
        sender.balance = sender.balance - amount
        receiver.balance = receiver.deposit(amount)
        @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    while @status == "complete"
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end
  
  
  
  

end