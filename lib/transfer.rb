class Transfer
  attr_reader :sender, :receiver, :status, :amount
  def initialize(acc_1, acc_2, amount)
    @sender = acc_1
    @receiver = acc_2
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def balance_check(owner) #checks if the balance is sufficient
    @sender.balance >= @amount
  end

  def execute_transaction
    if @status == "pending" && self.valid? && balance_check(@sender)
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && self.valid? && balance_check(@receiver)
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      @status = "reversed"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end
end
