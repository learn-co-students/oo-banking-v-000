require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance > self.amount && self.status != "complete"
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @sender.balance > self.amount && self.status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      self.status = "reversed"

    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end