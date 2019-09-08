class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def transfer_valid?
    @sender.balance - @amount > 0
  end

  def execute_transaction
    if transfer_valid?
      unless @status == 'complete'
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = 'complete'
      end
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.withdraw(@amount)
      @sender.deposit(@amount)
      @status = 'reversed'
    end
  end

end
