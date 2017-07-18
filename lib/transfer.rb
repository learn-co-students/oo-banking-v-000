require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount, :status


  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    receiver.valid? && sender.valid?
  end

  def execute_transaction
    if sender.balance >= @amount && @status == "pending"
      receiver.deposit(@amount)
      sender.balance = (sender.balance) - @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer #sender is amanda, receiver is avi
    if self.status != "pending"
      sender.balance = sender.balance + @amount
      receiver.balance = receiver.balance - @amount
      @status = "reversed"

    end
  end

end
