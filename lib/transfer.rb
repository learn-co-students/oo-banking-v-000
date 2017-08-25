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
    self.sender.balance >= amount && self.sender.valid? == true && self.receiver.valid? == true
  end

  def execute_transaction
    if self.valid? && self.status == "pending"
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @receiver.withdraw(amount)
      @sender.deposit(amount)
      @status = "reversed"
    end
  end

end
