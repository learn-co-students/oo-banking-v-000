class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def both_valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if both_valid? && status == "pending" && @sender.balance > amount
      @receiver.deposit(amount)
      @sender.deposit(-amount)
      self.status = "complete"
    elsif @sender.balance < amount
      reject_transfer
    end      
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if status == "complete"
      @sender.deposit(amount)
      @receiver.deposit(-amount)
      self.status = "reversed"
    end
  end
end