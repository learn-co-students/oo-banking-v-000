require 'pry'

class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && sender.valid?
      @receiver.balance = receiver.deposit(amount)
      @sender.balance = sender.deposit(amount * -1)
      if !sender.valid?
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
      @status = "complete"
    end
    end
  end

  def reverse_transfer
    if @status == "complete" || @status == "rejected"
      @receiver.balance = receiver.deposit(self.amount * -1)
      @sender.balance = sender.deposit(self.amount)
      @status = "reversed"
    end
  end
end
