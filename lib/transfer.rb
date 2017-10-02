require 'pry'
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount, :execute_once

  def initialize(sender,receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @execute_once = true
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.execute_once
  end

  def execute_transaction
    if self.valid?
      sender_new_balance = self.sender.balance - self.amount
      self.sender.balance = sender_new_balance
      receiver_new_balance = self.receiver.balance + self.amount
      self.receiver.balance = receiver_new_balance
      self.status = "complete"
      self.execute_once = false
    end
    if self.sender.valid? == false
      self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
    sender_new_balance = self.sender.balance + self.amount
    self.sender.balance = sender_new_balance
    receiver_new_balance = self.receiver.balance - self.amount
    self.receiver.balance = receiver_new_balance
    self.status = "reversed"
  end
  end

end
