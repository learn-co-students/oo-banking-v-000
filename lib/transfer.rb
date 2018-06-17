class Transfer
  attr_reader :status
  attr_accessor :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    # check that both accounts are valid
    # call on the sender & receiver's #valid? methods
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if self.valid? && status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
