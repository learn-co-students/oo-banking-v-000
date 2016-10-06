class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @receiver.valid? and @sender.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == true and @status == 'pending' and @sender.balance > @amount
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = 'complete'
    elsif @sender.balance < @amount
      @status = 'rejected'
      return 'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if @status == 'complete' and sender.valid? == true
      @receiver.balance -= @amount
      @sender.balance += @amount
      @status = 'reversed'
    end
  end

end
