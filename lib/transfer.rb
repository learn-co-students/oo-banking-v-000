class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    raise_error unless (sender.is_a? BankAccount) && (receiver.is_a? BankAccount) && (amount.is_a? Numeric)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.status == "pending" && self.amount <= self.sender.balance && self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    if valid?
      sender.deposit(-@amount)
      receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(@amount)
      receiver.deposit(-@amount)
      @status = "reversed"
    else
      "Transfer can't be reversed."
    end
  end
end
