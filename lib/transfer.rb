require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : self.status = "rejected"
    #meaning if the Transfer's initialized with just a string, 
    #this will reject it, b/c it's not checking for that string.
    #will need to update #valid? to check for string 

  end

  def execute_transaction
    if self.both_valid? && (self.status == "pending") && sender.balance >= self.amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      self.status = "complete"
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.deposit(-amount)
      sender.deposit(amount)
      self.status = "reversed"
    else
      reject_transfer
    end
  end

end