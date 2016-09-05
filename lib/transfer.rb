class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance >= @amount ? true : false
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @receiver.deposit(amount)
      @sender.deposit(-1 * (amount))
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(-1 * (amount))
      self.status = "reversed"
    end
  end
end
