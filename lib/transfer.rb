class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = BankAccount.new(sender).name
    @receiver = BankAccount.new(receiver).name
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    # Subtract transfer amount from sender and add to receiver
    # If sender doesn't have a valid account reject transfer
    while self.status == "pending"
      if self.sender.valid?
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      end
    end
    if self.sender.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end

end
