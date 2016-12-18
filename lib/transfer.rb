class Transfer
  attr_accessor :bank_account, :sender, :status, :receiver, :amount

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @status = "pending"
    @receiver = receiver
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if sender.status != "closed" || amount < sender.balance
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    end
  end
end
