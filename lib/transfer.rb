class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :transfer

  def initialize(sender, receiver, amount = money, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
        true
      else
        false
    end
  end

  def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete"
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = "reversed"
     end
  end
end
