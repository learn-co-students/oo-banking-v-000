class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender= sender
    @receiver= receiver
    @status= "pending"
    @amount= amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def reject_transfer
    @status = "rejected"
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end

end
