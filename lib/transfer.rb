class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    receiver.valid? && 
      sender.valid? && 
      sender.balance > amount
  end

  def execute_transaction
    if valid? && status == "pending"
      @status = "complete"
      sender.balance -= amount
      receiver.balance += amount
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
