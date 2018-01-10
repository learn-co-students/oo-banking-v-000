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

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance - @amount >= 0 ? true: false
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @sender.last_balance = @sender.balance
      @receiver.last_balance = @receiver.balance
      @sender.balance -= @amount
      @receiver.balance += @amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance = @sender.last_balance
      @receiver.balance = @receiver.last_balance
      self.status = "reversed"
    else
      @sender.balance
      @receiver.balance
    end
  end
end
