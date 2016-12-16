class Transfer
  attr_accessor :status, :transactions
  attr_reader :sender, :receiver, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && receiver.valid?
  end

  def execute_transaction
    @sender.balance -= amount
    if @sender.valid? && @status != 'complete'
      @receiver.deposit(amount)
      @status = 'complete'
    else
      @sender.balance += amount
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.deposit(amount)
      @receiver.balance -= amount
      @status = 'reversed'
    end
  end
end
