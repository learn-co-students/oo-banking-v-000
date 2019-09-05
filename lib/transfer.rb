class Transfer
  # your code here
  attr_accessor :amount, :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
      if valid? && status == "pending" && @sender.balance > @amount
        @sender.deposit(-@amount)
        @receiver.deposit(@amount)
        @status = "complete"
      else !sender.valid?
        @status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
    end

  def reverse_transfer
    if status == "complete"
    @sender.deposit(@amount)
    @receiver.deposit(-@amount)
    @status = "reversed"
    end
  end


end
