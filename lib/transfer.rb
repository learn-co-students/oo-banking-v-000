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
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    # sender amount moved to receiver balance (complete)
    elsif @sender.balance


    # transfer can only happen once (complete)
    else

    end


  end
end
