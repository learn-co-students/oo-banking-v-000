class Transfer
  # code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    self.status = "pending"
  end

  def both_valid?
    sender = self.sender
    receiver = self.receiver
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if both_valid? && status == "pending"
      if amount < self.sender.balance
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      else
         self.status = "rejected"
         "Transaction rejected. Please check your account balance."
      end
    else
       self.status = "rejected"
       "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" && amount < self.receiver.balance
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    else
      "Unable to reverse transfer."
    end
  end
end