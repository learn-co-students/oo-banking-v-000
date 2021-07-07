class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    withdrawal = amount * -1
    if @sender.balance > amount && sender.valid? && self.status == "pending"
      @sender.deposit(withdrawal)
      @receiver.deposit(amount)
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      withdrawal = amount * -1
      @sender.deposit(amount)
      @receiver.deposit(withdrawal)
      self.status = "reversed"
    end
  end
  
end
