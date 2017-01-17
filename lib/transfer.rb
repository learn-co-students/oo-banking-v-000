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
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if !valid? || self.amount > self.sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif status == "pending"
      receiver.deposit(amount)
      sender.deposit(amount * -1)
      self.status = "complete"
    end
  end

  def reverse_transfer
    if self.status == 'complete'
      receiver.deposit(amount * -1)
      sender.deposit(amount)
      self.status = 'reversed'
    end
  end
end
