class Transfer
  # your code here
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    @sender_orginal_balance = @sender.balance
    @receiver_orginal_balance = @receiver.balance
    if @status == "pending" && valid?
      @receiver.balance = amount + @receiver.balance
      @sender.balance = @sender.balance - amount
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if status == "complete"
      @receiver.balance = @receiver_orginal_balance
      @sender.balance = @sender_orginal_balance
      @status = "reversed"
    end

  end


end
