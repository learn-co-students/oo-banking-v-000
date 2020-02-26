class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount = 50)
    # initializing variables
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def sufficient_funds
    self.sender.balance > self.amount
  end

  def valid?
    (self.sender.valid? && self.receiver.valid? && self.status == "pending" && self.sufficient_funds) ? true : false
  end

  def transact_transfer
    self.sender.withdraw(self.amount)
    self.receiver.deposit(self.amount)
    self.status = "complete"    
  end

  def transact_reverse
    self.receiver.withdraw(self.amount)
    self.sender.deposit(self.amount)
    self.status = "reversed"
  end

  def execute_transaction
    if !self.sender.valid? || !self.sufficient_funds
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.valid?
      self.transact_transfer
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.transact_reverse
    end
  end
  
end
