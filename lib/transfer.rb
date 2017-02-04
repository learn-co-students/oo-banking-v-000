class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if @sender.is_a?(BankAccount) && @receiver.is_a?(BankAccount) && @amount.is_a?(Integer)
      if @sender.valid? && @receiver.valid?
        if @sender.balance > @amount
        true
    else
      false
      end
    end
  end
end

  def execute_transaction
    if self.valid? && @status == "pending"
      @sender.withdraw(amount)
      @receiver.deposit(amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && @status == "complete"
      @sender.deposit(amount)
      @receiver.withdraw(amount)
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

end
