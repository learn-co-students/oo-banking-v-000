require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :bankaccount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
    #binding.pry
  end

  def execute_transaction
  if valid? && self.status == "pending" && @sender.balance >= @amount
     @sender.balance -= @amount
     @receiver.balance += @amount
     self.status = "complete"
     #binding.pry
  else
     self.status = "rejected"
     "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      @sender.balance += @amount
      @receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
