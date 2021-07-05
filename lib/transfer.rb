require 'pry'
class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  @@all_transactions = []

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def rejected_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && @sender.balance > amount && self.status =="pending"
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    else
      rejected_transfer
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete"
      @receiver.balance -= amount
      @sender.balance += amount
      self.status = "reversed"
    else
      rejected_transfer
    end
  end

end
