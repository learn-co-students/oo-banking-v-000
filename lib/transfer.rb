class Transfer
  # your code here
  attr_accessor :sender, :amount, :status, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true && @sender.balance > @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? == true && @status == "pending"
      @sender.balance = @sender.balance - @amount
      @receiver.balance = @receiver.balance + @amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if @status == "complete"
      @sender.balance = @sender.balance + amount
      @receiver.balance = @receiver.balance - amount
      @status = "reversed"
    end
  end





end
