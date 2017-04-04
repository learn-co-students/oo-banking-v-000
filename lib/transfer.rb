class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end



  def valid?
    if self.sender.valid? && self.receiver.valid?
      return true
    else false
    end
  end

  def execute_transaction
    if self.sender.balance < amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif self.status == "pending"
        self.sender.balance =  self.sender.balance - amount
        self.receiver.balance = self.receiver.balance + amount
        self.status = "complete"
      end
    end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end
  # your code here
end
