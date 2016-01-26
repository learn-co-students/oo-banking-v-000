class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def both_valid?
    (@sender.valid? && @receiver.valid?) ? true : false
  end

  def execute_transaction
    (both_valid? && @status == 'pending' && @sender.balance > @amount) ? accept_transfer : reject_transfer
  end

  def reject_transfer
    @status = 'rejected'
    'Transaction rejected. Please check your account balance.'
  end

  def accept_transfer
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = 'complete'
  end

  def reverse_transfer
    if @status == 'complete' 
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = 'reversed'
    end
  end

end
