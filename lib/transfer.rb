class Transfer
  attr_accessor :status, :amount
  attr_reader :sender, :receiver

    def initialize(sender, receiver, amt = 50)
      @sender = sender
      @receiver = receiver
      @status = "pending"
      @amount = amt
    end

    def valid?
      @sender.valid? && @receiver.valid?
    end

    def execute_transaction
      if self.status == "pending" && self.sender.balance >= self.amount
        self.sender.balance -= self.amount
        self.receiver.balance += self.amount
        self.status = "complete"
      else
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
end # => End class Transfer
