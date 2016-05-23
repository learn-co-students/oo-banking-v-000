require 'pry'

class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if self.valid? && !@@all.include?(self)
      (@sender.balance = @sender.balance - @amount) && (@receiver.balance = @receiver.balance + @amount)
      @@all << self
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    t = @@all.last
    t.sender.balance = t.sender.balance + t.amount
    t.receiver.balance = t.receiver.balance - t.amount
    self.status = "reversed"
  end

end
