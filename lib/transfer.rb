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

  def reject_transfer
    @status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if @status == 'pending' && @sender.balance >= amount && valid?
      @sender.widthdraw(amount)
      @receiver.deposit(amount)
      @status = 'complete'
    else
      self.reject_transfer
    end
  end

  def reverse_transfer
    if @status == 'complete'
      @receiver.widthdraw(amount)
      @sender.deposit(amount)
      @status = 'reversed'
    else
      self.reject_transfer
    end
  end

end
