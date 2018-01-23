class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  #acts as a space for a transaction between two instances of the bank account class
  #initializesas a pending status
  #status can change to completed or rejected
  #completed transfer can be reversed and status changed to reversed

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  #will check the validity of the account number
  def valid?
    sender.valid? && receiver.valid?
  end

  #will verify has enough funds to Transfer
  #will reject the transfer if they don't have enough funds
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end
