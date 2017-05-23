class Transfer
  # your code here
  attr_reader :sender, :receiver, :previous_sender, :previous_receiver
  attr_accessor :status, :amount

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
    if @sender.valid? && @sender.balance > @amount && @status != "complete"
      @previous_sender = @sender.balance
      @previous_receiver = @receiver.balance
      @sender.balance= (@sender.balance - @amount)
      @receiver.balance= (@receiver.balance + @amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if status == "complete"
      @sender.balance = @previous_sender
      @receiver.balance = @previous_receiver
      @status = "reversed"
    end
  end
end
