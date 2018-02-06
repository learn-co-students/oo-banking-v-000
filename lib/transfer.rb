require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? && status == "pending"
  end

  def execute_transaction
    if sender.valid? && sender.balance > amount && status == "pending"
      sender.balance = sender.balance - amount
      receiver.balance = receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
      @status = "reversed"
    end

  end

end
