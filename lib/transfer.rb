class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  attr_reader :BankAccount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    (self.receiver.valid? && self.sender.valid?)? true : false
  end

  def execute_transaction
      if self.sender.balance < self.amount
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      elsif self.valid? && self.status == "pending"
        self.receiver.balance += self.amount
        self.sender.balance -= self.amount
        self.status = "complete"
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
