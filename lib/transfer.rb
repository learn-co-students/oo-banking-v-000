require 'pry'
class Transfer

  attr_reader :sender , :receiver , :amount , :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.sender.valid? && self.sender.balance - self.amount > 0 && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.balance -= self.amount
      self.sender.balance += self.amount
      @status = "reversed"
    end
  end


end
