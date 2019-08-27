class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if self.status == "pending"
      if valid? && sender.balance > amount
        self.status = "complete"
        sender.balance -= amount
        receiver.balance += amount
      else
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if self.status == "complete" && receiver.balance > amount
      self.status = "reversed"
      receiver.balance -= amount
      sender.balance += amount
    end
  end

end
