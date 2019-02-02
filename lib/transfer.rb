class Transfer
  attr_accessor :amount, :status
  attr_reader :sender, :receiver, :bank_account

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    self.amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transation(amount)
    # sender amount moved to receiver balance (complete)
    if condition

    # transfer can only happen once (complete)
    elsif condition

    # if sender account is not valid, reject transfer (rejected)
    else

    end


  end
end
