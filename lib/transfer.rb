class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if self.valid? && @status == 'pending'
      @receiver.deposit(@amount)
      @sender.debit(@amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.debit(@amount)
      @sender.deposit(@amount)
      @status = 'reversed'
    end
  end
end
