class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = "pending"
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
    if amount > sender.balance
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    elsif valid? == true && @status == "pending"
      sender.balance = sender.balance - amount
      receiver.deposit(amount)
      @status = "complete"
    elsif @status == "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      receiver.balance = receiver.balance - amount
      sender.deposit(amount)
      @status = "reversed"
    end
  end

end
