class Transfer
  # your code here
  attr_accessor :status, :sender, :receiver, :amount

  def initialize(from, to, amount)
    @sender, @receiver, @amount = from, to, amount
    @status = "pending"
  end

  def execute_transaction
    if self.valid? && status == "pending"
      @sender.withdrawl(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdrawl(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

  def valid?
    @sender.balance - @amount >= 0 && @sender.valid? && @receiver.valid?
  end
end
