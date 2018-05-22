class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid? ? true : false
  end

  def execute_transaction
    if valid? && sender.balance > amount
      if self.status == "pending"
        self.receiver.deposit(self.amount)
        self.sender.deposit(-(self.amount))
        self.status = "complete"
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.receiver.deposit(-(self.amount))
      self.sender.deposit(self.amount)
      self.status = "reversed"
    end
  end
end
