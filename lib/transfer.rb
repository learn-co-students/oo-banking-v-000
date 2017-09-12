require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  PREVIOUS = @sender, @receiver, @amount

  def initialize(sender, receiver, amount)
    @transfer = 0
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid?
    receiver.valid?
    ((sender.balance > amount) && (sender.status == "open") && (@transfer == 0)) ? true : false
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance = sender.balance + amount
      receiver.balance = receiver.balance - amount
        @status = "reversed"
    end
  end

  def execute_transaction
    if valid?
      sender.balance = sender.balance - amount
      receiver.balance = receiver.balance + amount
      @status = "complete"
      @transfer += 1
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end



end
