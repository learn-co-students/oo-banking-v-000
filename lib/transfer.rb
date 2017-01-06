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
    self.sender.valid? == true && self.receiver.valid? == true
  end

  def execute_transaction
    if self.status == "complete"
      "This transfer has already been completed."
    elsif self.sender.balance < self.amount
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      self.sender.withdraw(self.amount)
      self.receiver.deposit(self.amount)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.withdraw(self.amount)
      self.status = "reversed"
    end
  end

end
