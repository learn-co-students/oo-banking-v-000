require 'pry'

class Transfer
  # code here
  attr_accessor :sender, :receiver, :amount, :status, :saved_amount, :executed

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def both_valid?
    sender = @sender
    receiver = @receiver
    if sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    # binding.pry
    if (self.both_valid? && @sender.balance >= @amount)
      @receiver.balance += @amount
      @sender.balance -= @amount
      @saved_amount = @amount
      @status = "complete"
      @amount = 0
      @executed = true
    else
      self.reject_transfer
    end
  end

  def reject_transfer
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @executed
      @receiver.balance -= @saved_amount
      @sender.balance += @saved_amount
      @status = "reversed"
    end
  end
end