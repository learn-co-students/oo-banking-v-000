class Transfer

  attr_accessor :transfer, :status, :amount, :done
  attr_reader :sender, :receiver#, :amount

  def initialize(sender, receiver, amount)
    @transfer = transfer
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @done = ""
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > amount
  end

  def execute_transaction
    if self.valid? == false && @done != "done"
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif @done != "done"
      @sender.deposit(-@amount)
      @receiver.deposit(@amount)
      @done = "done"
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(-@amount)
      @status = "reversed"
    end
  end

end
