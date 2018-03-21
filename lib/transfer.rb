require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :amount_transferred

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : fals
  end

  def execute_transaction
    if @sender.valid? && @sender.balance > @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @amount_transferred = @amount
      @amount = 0
      # binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount_transferred
      @receiver.balance -= @amount_transferred
      @status = "reversed"
    end
  end

end
