class Transfer
  attr_reader :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @status == 'pending' && @sender.balance >= amount
      @sender.widthdraw(amount)
      @receiver.deposit(amount)
      @status = 'complete'
    else
      @status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.widthdraw(amount)
      @sender.deposit(amount)
      @status = 'reversed'
    end
  end

end
