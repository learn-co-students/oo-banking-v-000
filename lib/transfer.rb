class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if @status == "pending" && self.valid? == true && sender.balance >= @amount
      sender.deposit(-amount)
      receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && self.valid? == true
      sender.deposit(amount)
      receiver.deposit(-amount)
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
