class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end

  def execute_transaction
    #so, the accounts must be VALID,
    #transfer must be PENDING, and
    #the amount of the SENDER must be less than their balance.

    if self.valid? && self.status == "pending" && @sender.balance >= @amount
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      status_message = "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #status of Transfer must be "complete"
    #un-do the balances
    if self.status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
