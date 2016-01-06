class Transfer
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if !self.both_valid? ||amount > @sender.balance
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.both_valid? && self.status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount
      self.status = "complete"
    #elsif !self.both_valid? #||amount > @sender.balance
    #  self.status = "rejected"
    #  "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.balance += amount
      @receiver.balance -= amount
      self.status = "reversed"
    end
  end

end