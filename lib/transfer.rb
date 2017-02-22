class Transfer
  attr_accessor :status
  attr_reader :sender, :receiver, :amount
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? && @receiver.valid? && @sender.balance > @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status != "complete" && self.valid?
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end

end
