require 'pry'

class Transfer

  attr_reader
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if @status == "pending"
      sender.balance = sender.balance - @amount
      receiver.balance = receiver.balance + @amount
      if !receiver.valid? || !sender.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + @amount
      receiver.balance = receiver.balance - @amount
      @status = "reversed"
    end
  end

end
