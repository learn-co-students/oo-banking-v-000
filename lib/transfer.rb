
class Transfer
  # code here
  attr_accessor :amount, :sender, :receiver, :status, :last_transaction_amount

  def initialize(sender, receiver, status= "pending", amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def both_valid?
    sender = self.sender
    receiver = self.receiver 
    sender.valid? && receiver.valid? 
  end

  def execute_transaction
    if self.both_valid? && self.sender.balance >= amount && self.status == "pending"
      self.receiver.balance += amount 
      self.sender.balance -= amount
      self.last_transaction_amount = amount 
      self.status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end

  def reverse_transfer
    if self.status == "complete"
        self.sender.balance += self.last_transaction_amount
        self.receiver.balance -= self.last_transaction_amount
        self.status = "reversed"
    end 
  end 

end