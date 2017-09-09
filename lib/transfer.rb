class Transfer
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    receiver.valid? == true && sender.valid? == true ? true : false
  end

  def execute_transaction
    if @status != "complete"
      if sender.balance < amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else
        sender.balance -= amount
        receiver.balance += amount
        @status = "complete"
      end
    end
  end

  def reverse_transfer
    if @status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      @status = "reversed"
    end
  end
end
