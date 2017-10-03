require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction

    if self.status == "pending"
      self.sender.deposit(self.amount*-1)
      self.receiver.deposit(self.amount)
      self.status = "complete"
      "Transaction #{self.status = "rejected"}. Please check your account balance." if !sender.valid?
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.deposit(self.amount)
      self.receiver.deposit(self.amount*-1)
      self.status = "reversed"
    end
  end
end
