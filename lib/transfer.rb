
class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status = "pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true
      return true
    else
      return false
    end
  end

  def deposit(amount)
    @balance = @balance + amount
  end

  def withdrawal(amount)
    @balance = @balance - amount
  end

  def rejected
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      @sender.withdrawal(amount)
      @receiver.deposit(amount)
      self.status = "complete"
    else
      rejected
    end
  end

  def reverse_transfer
    if valid? && self.status == "complete"
      @sender.deposit(amount)
      @receiver.withdrawal(amount)
      self.status = "reversed"
    else
      rejected
    end
  end

end
