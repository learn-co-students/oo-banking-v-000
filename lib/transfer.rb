require 'pry'

class Transfer

  attr_accessor :amount, :status
  attr_reader :receiver, :sender

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance >= amount
  end

  def execute_transaction

    if @status == "pending" && valid?
      #binding.pry
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
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
