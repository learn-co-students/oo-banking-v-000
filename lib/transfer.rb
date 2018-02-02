

class Transfer
  # your code here
  attr_accessor :status
  attr_reader :sender, :receiver

  def initialize(sender, receiver, transfer_amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @transfer_amount = transfer_amount
  end

  def amount
    @transfer_amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if self.valid? && @sender.balance > @transfer_amount && @status == "pending"
      @sender.withdraw(@transfer_amount)
      @receiver.deposit(@transfer_amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."

    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.withdraw(@transfer_amount)
      @sender.deposit(@transfer_amount)
      @status = "reversed"
    end
  end

end
