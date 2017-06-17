require 'pry'

class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status == 'pending' && self.valid? && self.sender.balance >= self.amount
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = 'complete'
    elsif !(self.sender.balance >= self.amount)
      self.status = 'rejected'
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == 'complete'
    self.receiver.balance -= self.amount
    self.sender.balance += self.amount
    self.status = 'reversed'
    end
  end
end
