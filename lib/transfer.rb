require "pry"

class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize (sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && status == "pending" && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
      return_status = status
    else
      @status = "rejected"
      return_status = "Transaction rejected. Please check your account balance."
    end
    return_status
  end

  def reverse_transfer
    if valid? && status == "complete" && receiver.balance >= amount
      receiver.balance -= amount
      sender.balance += amount
      @status = "reversed"
    end
  end

end
