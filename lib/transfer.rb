class Transfer
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @reversal_eligibility = "not applicable"
  end

  def valid?
    sender.valid? && receiver.valid? && sender.balance > amount ? true : false
  end

  #withdraws money from the sender's @balance and sends it to the receiver's @balance
  #if the transaction is valid and hasn't been executed already. The @reversal_eligibility
  #flag prevents the transaction from being duplicated, but allows for the transfer to be
  #reversed if necessary.
  def execute_transaction
    if valid? && @status == "pending"
      sender.withdraw(amount)
      receiver.deposit(amount)
      @status = "complete"
      @reversal_eligibility = "yes"
      "Transfer completed. $#{amount} has been transferred from #{sender.name}'s account to #{receiver.name}'s account."
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  #it allows for the transfer to be reversed #execute_transaction was succesful and
  #the transer is eligible for reversal. @status may show as rejected if an attempt
  #was made to duplicate the transaction.
  def reverse_transfer
    if @status == "complete" || @reversal_eligibility == "yes"
      receiver.withdraw(amount)
      sender.deposit(amount)
      @status = "reversed"
      @reversal_eligibility = "no"
      "The transfer was successfully reversed. $#{amount} was returned to the account of origin."
    else
      "Unable to reverse transaction."
    end
  end
end
