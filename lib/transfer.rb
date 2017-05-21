class Transfer
  # your code here
  attr_reader :status, :sender, :receiver, :amount
  def initialize(from, to, amount)
    @sender = from
    @receiver = to
    @amount = amount
    @status = "pending"
  end
  def valid?
    @sender.valid? && @receiver.valid?
  end
  def execute_transaction
    if self.valid? && @status == "pending" && @sender.balance >= amount
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
    if @status == "complete" && self.valid?
      @status = "reversed"
      @receiver.balance -= amount
      @sender.balance += amount
    end
  end
end
