require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance > self.amount ? true : false
  end

  def execute_transaction
    if !self.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "complete"
      "Error! You have already executed this transaction."
    else
      @last_sender, @last_receiver, @last_amount = self.sender, self.receiver, self.amount
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @last_receiver.balance -= @last_amount
      @last_sender.balance += @last_amount
      self.status = "reversed"
    end
  end

end
