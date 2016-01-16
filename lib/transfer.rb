class Transfer
  # code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def both_valid?
    if @sender.valid? && receiver.valid?
      return true
    else
      return false
    end
  end

  def execute_transaction
    if !(both_valid?&&(@sender.balance-@amount)>0)
      return reject_transfer
    elsif @status == 'pending'
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = 'complete'
    end
  end

  def reject_transfer
      @status = 'rejected'
      return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == 'complete'
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = 'reversed'
    end
  end

end