class Transfer
  attr_reader :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount || !valid?
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    elsif @status == 'pending'
      @receiver.deposit(@amount)
      @sender.balance -= @amount
      @status = 'complete'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.balance -= @amount
      @sender.deposit(@amount)
      @status = 'reversed'
    end
  end
end
