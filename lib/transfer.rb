require "pry"

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @amount = amount
    @sender = sender
    @receiver = receiver
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    else
      false
    end
  end

  def execute_transaction
    if @status != "complete" && sender.balance > amount
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    elsif sender.balance < amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end
end
