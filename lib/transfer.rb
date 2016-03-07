class Transfer
  attr_reader :sender, :receiver, :amount, :status

  #///CLASS METHODS ///#

  #///INSTANCE METHODS ///#
  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && both_valid? && sender.balance > amount
      sender.deposit(@amount * -1)
      receiver.deposit(@amount)
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete" && both_valid? && receiver.balance > amount
      receiver.deposit(amount * -1)
      sender.deposit(amount)
      @status = "reversed"
    else
      reject_transfer
    end
  end

end