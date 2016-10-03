class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount #Since sender, receiver or amount cannot be altered for a transfer instance after initialize

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid? # To check for the validity of accounts, as well as transfer amount
    (self.sender.valid? && self.receiver.valid? && self.amount == 50) ? true : false
  end

  def execute_transaction
    if self.valid?
      if self.status == "pending"
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" # Allows reversal of only completed transactions
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end
end
