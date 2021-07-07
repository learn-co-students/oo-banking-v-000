class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount =  amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && sender.balance >= amount
  end

  def execute_transaction
    # we check if the transaction is valid, make sure the transaction only happens once, at what point does the transaction complete?
    # (We don't want to execute a transaction that's already been complete)
    #  if it is a valid transaction then we subtract the sender's balance by the amount
    #  then we add the amount to the receivers balance
    #  then we mark the transaction as complete
    # otherwise
    #  we reject the transfer
    #  we return a statement that tells the user that the transfer was rejected
    if self.valid? && @status != "complete"
        @sender.balance = @sender.balance - @amount
        @receiver.balance =  @receiver.balance + @amount
        @status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #We can only reverse a transaction if it has been executed and the status is complete
    if self.execute_transaction
      @receiver.balance =  @receiver.balance - @amount
      @sender.balance = @sender.balance + @amount
      @status = "reversed"
    end
  end
  ### Bad Scenarios ###
  # sender has a bad account and tries to send a receiver some money
  # sender doesn't have the money to send

end
