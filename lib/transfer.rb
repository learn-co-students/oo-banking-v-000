
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount

    @status = "pending"
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if sender.valid? && sender.balance >= amount
      sender.balance -= amount
      receiver.balance += amount
      @amount_record = amount
      self.amount = 0
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete" && receiver.valid? && receiver.balance >= @amount_record
      receiver.balance -= @amount_record
      sender.balance += @amount_record
      self.status = "reversed"
    else
      nil
    end
  end

end #<----- CLASS end
