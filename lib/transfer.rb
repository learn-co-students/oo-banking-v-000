class Transfer
  # code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(account1, account2, amount)
    @sender = account1
    @receiver = account2
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if status == "pending" && sender.balance >= amount && self.both_valid?
      sender.balance -= amount
      receiver.balance += amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete" && receiver.balance >= amount && self.both_valid?
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
