class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    result = nil
    if !@sender.valid? || @sender.balance < @amount
      result = "Transaction rejected. Please check your account balance."
      @status = "rejected"
    elsif status == "pending" && valid?
      @sender.withdraw(@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
    result
  end

  def reverse_transfer
    if status == "complete"
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = "reversed"
    end
  end
end
