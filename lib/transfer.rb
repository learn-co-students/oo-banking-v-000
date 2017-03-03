require 'pry'

class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  @counter = 0

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid?
    receiver.valid?
  end

  def execute_transaction
    if @status == "complete"
      return false
    elsif sender.balance < @amount
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + @amount
      receiver.balance = receiver.balance - @amount
      @status = "reversed"
    else return false
    end
  end
end
