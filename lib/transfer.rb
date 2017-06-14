require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    # binding.pry
    if valid? && sender.balance > amount && @status != "complete"
      receiver.deposit(amount)
      sender.balance = sender.balance - amount
      @status = "complete"
      # binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.deposit(amount)
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    end
  end

  # your code here
end
