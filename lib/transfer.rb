class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  @@completed_transfers = []
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
    if self.status == "pending"
      if self.sender.balance - amount < 0
        self.status = "rejected"
        "Transaction rejected. Please check your account balance."
      else
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
        @@completed_transfers << self
      end      
    end  
  end
      
  def reverse_transfer
    transaction = @@completed_transfers.last
    transaction.sender.balance += transaction.amount
    transaction.receiver.balance -=transaction.amount
    transaction.status = "reversed"
  end

end
