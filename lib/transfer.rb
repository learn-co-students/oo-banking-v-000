require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :amount, :status, :BankAccount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance >= @amount
      @sender.deposit(@amount.to_i * -1)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount.to_i * -1)
      @status = "reversed"
    end
  end

end
