class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    (sender.valid? && receiver.valid?) && self.amount < sender.balance
  end

  def execute_transaction
    if self.both_valid? && self.status == "pending"
      sender.withdraw(amount)
      receiver.deposit(amount)
      self.status = "complete"
    else 
      self.reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      sender.deposit(amount)
      receiver.withdraw(amount)
      self.status = "reversed"
    end
  end


end