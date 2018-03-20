class Transfer

  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    true if sender.valid? == true && receiver.valid? == true
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status=("complete")
    else
      self.status=("rejected")
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.execute_transaction
      receiver.balance -= amount
      sender.balance += amount
      self.status=("reversed")
    end
  end

end
