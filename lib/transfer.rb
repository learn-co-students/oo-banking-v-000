class Transfer
  attr_accessor :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.status == "pending"
  end

  def execute_transaction
    if status == "pending" && self.sender.valid?
      self.sender.balance -= amount
      self.receiver.balance += amount
      self.status = "complete"
    else
      self.status == "rejected"
    end
        #binding.pry
  end

  def reverse_transfer
    if status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end
=begin

elsif  self.sender.valid? == false
  "Transaction rejected. Please check your account balance."
  self.status = "rejected"
end
=end
