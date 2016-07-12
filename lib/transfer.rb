class Transfer
  attr_accessor :status, :sender, :receiver, :amount
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
  #each transfer can only happen once
    if self.status =="complete"
      self.sender.balance -= 0
      self.receiver.balance += 0
    else

    #can execute a successful transaction between two accounts
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"

    #rejects a transfer if the sender doesn't have a valid account
      if self.sender.balance < self.amount
        self.status = "rejected"
        "Transaction rejected. Please check your account balance." 
      end
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end









