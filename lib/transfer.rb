require 'pry'

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount, :sender_starting_balance

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @sender_starting_balance = @sender.balance
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true:false
  end

  def execute_transaction
    if valid? && @status == "pending" && @amount <= @sender.balance
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  end

  def reverse_transfer
    if valid? && @status == "complete" && @receiver.balance > @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
