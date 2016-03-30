require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount=50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if @status != "complete" && @sender.valid? == true && @receiver.valid? == true && (@sender.balance - @amount) >= 0
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
