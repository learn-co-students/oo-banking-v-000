class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  #Transfers start out in a "pending" status.
  #They can be executed and go to a "complete" state.
  #They can also go to a "rejected" status.
  #A completed transfer can also be reversed and go into a "reversed" status.

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    self.sender.valid? && self.receiver.valid? ? true : false
  end

  def execute_transaction
    if self.sender.balance >= self.amount && self.status == "pending"
      self.sender.balance -= self.amount
      self.receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += self.amount
      self.receiver.balance -= self.amount
      self.status = "reversed"
    end
  end


end
