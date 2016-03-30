require 'pry'

class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if valid_transfer?
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def valid_transfer?
    if sender.balance < @amount || both_valid? == false
      false
    elsif @status == "pending"
      true
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
