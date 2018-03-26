class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    (@sender.valid? && @receiver.valid? && @sender.balance > @amount)
  end

  def execute_transaction
    if self.valid? == false
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @status != "pending"
      "Transaction not permitted."
    else
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    else
      "Transaction cannot be reversed."
    end
  end



end
