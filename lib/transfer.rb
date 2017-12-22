require_relative 'bank_account.rb'

class Transfer

  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @receiver = receiver
    @sender = sender
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status != "complete" && self.valid? && sender.balance > @amount
    sender.balance -= @amount
    receiver.balance += @amount
    self.status = "complete"
   else
     self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if !(self.status == "reversed" || self.status == "pending")
      sender.balance += self.amount
      receiver.balance -= self.amount
      self.status = "reversed"
    end
  end



end
