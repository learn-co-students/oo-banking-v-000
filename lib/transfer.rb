class Transfer
  attr_reader(:sender, :receiver, :amount, :status)
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @previous_amount = 0
  end

  def valid?
    @sender.valid?(@amount) && @receiver.valid?(@amount)
  end

  def execute_transaction
    if self.valid?
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @previous_amount = @amount
      @amount = 0
      @status = "complete"


    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    @sender.deposit(@previous_amount)
    @receiver.deposit(-@previous_amount)
    @status = "reversed"
  end
end
