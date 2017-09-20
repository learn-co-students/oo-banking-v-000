require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @amount < @sender.balance
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? && status != "complete"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
      binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      @receiver.balance = @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      @status = "reversed"
    end
  end

end
