require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  attr_reader

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid?
    @receiver.valid?
  end

  def has_enough?
    @sender.balance >= @amount
  end

  def execute_transaction
    @executedtransfers = 0
    if @status == "pending" && has_enough?
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @executedtransfers =+ 1
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @executedtransfers == 1
    @sender.balance = @sender.balance + @amount
    @receiver.balance = @receiver.balance - @amount
    @executedtransfers +- 1
    @status = "reversed"
  else
    "Transaction rejected. Please check your account balance."
  end
  end
end

#Amanda sender
#avi receiver
