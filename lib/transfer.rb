require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender_obj, receiver_obj, amount)
    @sender = sender_obj
    @receiver = receiver_obj
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # the transaction cannot complete with a negative balance in one of the accounts.
    if self.status == "pending" && self.sender.valid? && self.amount <= self.sender.balance
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
