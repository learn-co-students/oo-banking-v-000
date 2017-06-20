class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @sender.balance > @amount && @status == "pending"
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == true
       @receiver.deposit(@amount)
       @sender.deposit(-@amount)
       @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(-@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
