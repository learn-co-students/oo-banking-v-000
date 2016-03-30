require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && sender.balance > amount
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      reject_transfer
    end
  end

  def reject_transfer
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
