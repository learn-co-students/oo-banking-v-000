class Transfer

  attr_accessor :status, :amount, :sender, :receiver

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
    if @sender.valid? && sender.balance > @amount
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
      @amount = 0
    else
      @status = "rejected"
      @amount = 0
      "Transaction rejected. Please check your account balance."
    end
  end



end
