require 'pry'

class Transfer
  # your code here

  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
      if (sender.valid? && receiver.valid?)
        true
      else
        false
      end
  end

  def execute_transaction
    if @status == "complete"

    elsif (@receiver.status == "closed" || @sender.balance - amount < 0)
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
