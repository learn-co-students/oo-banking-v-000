class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    valid = false
    if @sender.valid? && @receiver.valid?
      valid = true
    end
    valid
  end

  def execute_transaction
    if @status == 'pending'
      if @sender.balance > @amount
        @sender.withdraw(@amount)
        @receiver.deposit(@amount)
        @status = 'complete'
      else
        @status = 'rejected'
        "Transaction rejected. Please check your account balance."
      end
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(@amount)
      @receiver.withdraw(@amount)
      @status = 'reversed'
    end
  end
end
