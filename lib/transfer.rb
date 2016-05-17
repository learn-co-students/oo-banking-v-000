class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount) #sender and receiver are instance of bank_account class
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.balance >= self.amount && self.status == "pending"
      receiver.deposit(amount)
      sender.deposit(-amount)
      self.status = "complete"
    end
    if sender.balance < self.amount || !sender.valid?
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      receiver.deposit(-amount)
      sender.deposit(amount)
      self.status = "reversed"
    end
  end


end
