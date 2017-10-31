class Transfer

  attr_accessor :sender, :receiver, :status, :amount
  def initialize(giver, receiver, amount)
    @sender = giver
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == "pending" && @sender.balance > @amount
    @sender.withdraw(@amount)
    @receiver.deposit(@amount)
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
  end

  def reverse_transfer
    if @status != "reversed" && self.execute_transaction
    @sender.deposit(@amount)
    @receiver.withdraw(@amount)
    @status = "reversed"
  end
  end


end
