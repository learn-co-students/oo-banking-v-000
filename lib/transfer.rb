class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if @receiver.BankAccount.valid? and @sender.BankAccount.valid? == true
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == true and @status == 'pending'
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = 'complete'
    else
      return "Transaction rejected. Please check your account balance."
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
