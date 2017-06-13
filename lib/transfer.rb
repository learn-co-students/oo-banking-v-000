class Transfer
  attr_accessor :status
  attr_reader :receiver, :sender, :amount

  def initialize(sender, receiver, amount)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def execute_transaction
    if valid? && (@sender.balance - @amount) >= 0
      @sender.deposit(-@amount)
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
      @receiver.deposit(-@amount)
      @status = "reversed"
    else
      "Cannot reverse a non-complete transaction"
    end
  end

  def valid?
    @sender.valid? and @receiver.valid? and @status == "pending"
  end



end
