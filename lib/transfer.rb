class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    # if @sender.valid? && @receiver.valid?
    #   true
    # else
    #   false
    # end
    @sender.valid? && @receiver.valid? && @amount <= @sender.balance ? true : false
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @receiver.deposit(@amount)
      @sender.withdraw(@amount)
      @status = "complete"
    else
      self.reject
      "Transaction rejected. Please check your account balance."
    end
  end

  def reject
    @status = "rejected"
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      @status = "reversed"
    end
  end

end
