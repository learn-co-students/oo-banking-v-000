class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def both_valid?
    sender.valid? && receiver.valid? # is calling the #valid? method in the BankAccount class to check validation
  end

  def execute_transaction
    if self.status != "complete" && both_valid? && sender.balance > amount # evaluating expressions, if true run code below, else reject it
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    if self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" # if expression is true, update the instance variable values
      @sender.balance += amount
      @receiver.balance -= amount
      @status = "reversed"
    end
  end

end
